extends CharacterBody2D

signal personajeMuerto

@export var area2D : Area2D
@export var materialPersonajeAzul : ShaderMaterial
@export var materialPersonajeRojo : ShaderMaterial
@export var materialPersonajeVerde : ShaderMaterial
@export var reproductor: Array[AudioStreamPlayer2D]

const SPEED = 200.0
const JUMP_VELOCITY = -250.0
const ACCELERATION = 3000
var _skate: bool = false;
var _inWater: bool =false;
var drown: int 
func _ready():
	add_to_group("personajes")
	area2D.body_entered.connect( _on_area_2d_body_entered)
	get_parent().get_parent().finNivel.connect(finDelNivel)



func _physics_process(delta: float) -> void:	
	# Add the gravity.
	
	if not is_on_floor():
		if _inWater:
			velocity.y = get_gravity().y *0.2 * delta  # caída lenta
		else:
			velocity += get_gravity() * delta *0.99
	if _inWater and is_on_floor() and $AnimatedSprite2D.material == materialPersonajeAzul:
		position.y = drown  # mantenemos posicion
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and !_inWater:
		velocity.x = move_toward(velocity.x,direction * SPEED , ACCELERATION * delta)
		#velocity.x =direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)		
	
	animaciones()
	move_and_slide()


func animaciones():
			
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true		
	elif Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
	elif velocity.x != 0 or velocity.y !=0:
		
		if !_skate:
			$AnimatedSprite2D.play("start running")
			_skate= true
		else:
			pass#$AnimatedSprite2D.play("keep running")
	else:
		if(_skate):
			$AnimatedSprite2D.play("Get_off_scate")
			_skate = false;
		else:
			pass#$AnimatedSprite2D.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("me ahogo")
	drown = position.y
	if !_inWater:
		if "asesino" in body.name.to_lower():
			reproductor[0].play()
			$AnimatedSprite2D.material = materialPersonajeRojo
		else:
			reproductor[1].play()
			$AnimatedSprite2D.material = materialPersonajeAzul
		_inWater= true
		await get_tree().create_timer(1).timeout
		personajeMuerto.emit()
		ControladorGlobal.sumarMuertes()
	


func finDelNivel():
	reproductor[2].play()
	print("recibido señal final nivel")
	_inWater= true
	$AnimatedSprite2D.material = materialPersonajeVerde


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation =="start running":
		$AnimatedSprite2D.play("keep running")
	elif $AnimatedSprite2D.animation =="Get_off_scate":
		$AnimatedSprite2D.play("idle")

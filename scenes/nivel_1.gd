extends Button

@export var nivel: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("controlador global nivel maximo: " +str(ControladorGlobal.nivelMaximo))
	print("controlador global nivel: " +str(ControladorGlobal.nivel))
	if ControladorGlobal.nivelMaximo ==0:
		self.disabled = true
	else:
		pressed.connect(jugar)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func jugar():
	ControladorGlobal.nivel=1 
	get_tree().change_scene_to_packed(nivel)
	pressed.disconnect(jugar)

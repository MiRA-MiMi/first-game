extends Node2D

@export var area2d : Area2D
@export var reproductor: AudioStreamPlayer2D
var contenedorMonedas: ContenedorMonedas
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("monedas")
	area2d.body_entered.connect(_recoger)
	_animaciones()

func _recoger(_body: Node2D) -> void:
	contenedorMonedas.monedaRecogida()
	reproductor.reparent(get_parent())
	reproductor.play()
	await queue_free()

func _animaciones():
	var tween : Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self, "position:y", position.y -5, 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", position.y + 5, 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)

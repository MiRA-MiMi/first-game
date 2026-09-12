extends Button

@export var nivel: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ControladorGlobal.nivelMaximo <=4:
		self.disabled = true
	else:
		pressed.connect(jugar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func jugar():
	ControladorGlobal.nivel=3
	get_tree().change_scene_to_packed(nivel)
	pressed.disconnect(jugar)

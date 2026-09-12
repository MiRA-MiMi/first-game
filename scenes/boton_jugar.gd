extends Button

@export var escenaPrincipal: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(jugar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func jugar():
	get_tree().change_scene_to_packed(escenaPrincipal)
	pressed.disconnect(jugar)

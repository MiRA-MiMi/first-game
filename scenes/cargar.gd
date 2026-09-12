extends Button

@export var menuCargar: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(navegarPantallaCarga)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func navegarPantallaCarga():
	get_tree().change_scene_to_packed(menuCargar)
	pressed.disconnect(navegarPantallaCarga)

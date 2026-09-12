extends Button

@export var menuTienda: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(navegarPantallaTienda)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func navegarPantallaTienda():
	get_tree().change_scene_to_packed(menuTienda)
	pressed.disconnect(navegarPantallaTienda)

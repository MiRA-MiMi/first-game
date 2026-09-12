extends Button

@export var controladorPartida: ControladorPartida
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(volverMenu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func volverMenu():
	print("intentando volver a menu")
	if(controladorPartida!= null):
		controladorPartida.guardar_partida()
	get_tree().paused = false
	get_tree().change_scene_to_file(ControladorGlobal.menu_principal)
	pressed.disconnect(volverMenu)

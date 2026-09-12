extends Control

@export var controlador_partida: ControladorPartida
@export var contadorMonedasTotales: Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ControladorGlobal.menu_principal = get_tree().current_scene.scene_file_path
	controlador_partida.cargar_partida()
	contadorMonedasTotales.actualizarTexto()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Button

@export var controladorPartida: ControladorPartida
@export var contadorMonedasTotales: Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(borrarPartida)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func borrarPartida():
	print("llamando a borrar partida")
	controladorPartida.borrarPartida()
	contadorMonedasTotales.actualizarTexto()
	pressed.disconnect(borrarPartida)

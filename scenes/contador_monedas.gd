extends Control

@export var numMonedas: Label
@export var numTotal: Label

func _ready() -> void:
	ControladorGlobal.monedasActualizado.connect(actualizarTexto)

func actualizarTexto():
	numTotal.text = str(ControladorGlobal.monedasNivelCompletado)
	numMonedas.text = str(ControladorGlobal.monedasNivel)

extends Control

@export var numMonedas: Label


func _ready() -> void:
	ControladorGlobal.monedasActualizado.connect(actualizarTexto)
	actualizarTexto()

func actualizarTexto():
	numMonedas.text = str(ControladorGlobal.monedasTotales)

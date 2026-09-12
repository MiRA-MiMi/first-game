extends Control

@export var label: Label

func _ready() -> void:
	ControladorGlobal.muertesActualizado.connect(actualizarTexto)

func actualizarTexto():
	print(ControladorGlobal.muertes)
	label.text = str(ControladorGlobal.muertes)

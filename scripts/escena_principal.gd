extends Node2D

signal finNivel

@export var niveles : Array[PackedScene]
var nivelActual : int = 1
var nivelInstanciado : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crearNivel(nivelActual)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func crearNivel(numeroNivel : int):
	nivelInstanciado = niveles[numeroNivel - 1].instantiate()
	add_child(nivelInstanciado)
	var personajes := get_tree().get_nodes_in_group("personajes")
	if !personajes.is_empty():
		personajes[0].personajeMuerto.connect(reiniciarNivel)
	
	#esta manera no funciona si no esperamos a que elimine los children del nodo por completo
"""
	var personajes := get_tree().get_nodes_in_group("personajes")
	personajes[0].personajeMuerto.connect(reiniciarNivel)
		var hijos := nivelInstanciado.get_children()
	
	for i in hijos.size():
		if hijos[i].is_in_group("personajes"):
			hijos[i].personajeMuerto.connect(reiniciarNivel)
			break
"""

func desconectarSeñal():
	var personajes := get_tree().get_nodes_in_group("personajes")
	personajes[0].personajeMuerto.disconnect(reiniciarNivel)

func eliminarNivel():
	nivelInstanciado.queue_free()
	
func reiniciarNivel():
	#desconectarSeñal()
	eliminarNivel()
	await get_tree().process_frame
	crearNivel(nivelActual)

func siguienteNivel():
	finNivel.emit()
	if nivelActual == 1:
		nivelActual = 2
	else:
		nivelActual = 1

	eliminarNivel()
	await get_tree().process_frame
	crearNivel(nivelActual)
	

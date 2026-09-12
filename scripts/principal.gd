extends Node2D

signal finNivel

@export var niveles : Array[PackedScene]
@export var controlador_partida: ControladorPartida
@export var audioPlayer: AudioStreamPlayer

var nivelActual : int = 1
var nivelInstanciado : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("recibimos el nivel del controlador global :" +str( ControladorGlobal.nivel))
	nivelActual = ControladorGlobal.nivel
	print("Iniciamos el nivel actual :" +str( nivelActual))
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
		
	controlador_partida.guardar_partida()

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
	audioPlayer.cambiarCancion()
	#desconectarSeñal()
	eliminarNivel()
	await get_tree().process_frame
	crearNivel(nivelActual)

func siguienteNivel():
	finNivel.emit()
	await get_tree().create_timer(1).timeout
	ControladorGlobal.resetearMuertes()
	print("recibimos el nivel del controlador global :" +str( ControladorGlobal.nivel))
	nivelActual = ControladorGlobal.nivel
	if ControladorGlobal.nivel > ControladorGlobal.nivelMaximo:
		ControladorGlobal.nivelMaximo = ControladorGlobal.nivel - 1
	if nivelActual ==4 :
		nivelActual = 1
		ControladorGlobal.nivel = nivelActual
	reiniciarNivel()
	

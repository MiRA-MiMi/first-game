class_name  ControladorPartida
extends Node

var partida: DatosPartida

var ruta: String = "user://partida.tres"

func _ready() -> void:
	if ResourceLoader.exists(ruta):
		partida = load(ruta)
	else:
		partida = DatosPartida.new()
	print("READY ->", partida.resource_path)

func guardar_partida():
	print("partida resource path: ", partida.resource_path)
	print("guardamos partida")
	partida.monedasTotales = ControladorGlobal.monedasTotales
	print("partida nivel era: " +str(partida.nivel))
	if partida.nivel < ControladorGlobal.nivelMaximo:
		print("lo actualizamos con: " + str(ControladorGlobal.nivel - 1))
		partida.nivel = ControladorGlobal.nivelMaximo
	partida.ultimoNiveljugado = ControladorGlobal.nivel
	partida.muertes = ControladorGlobal.muertes
	partida.desbloqueaPersonaje2 = ControladorGlobal.desbloqueaPersonaje2
	partida.desbloqueaPersonaje3 = ControladorGlobal.desbloqueaPersonaje3
	partida.desbloqueaPersonaje4 = ControladorGlobal.desbloqueaPersonaje4

	partida.desbloqueaMusica2 = ControladorGlobal.desbloqueaMusica2
	partida.desbloqueaMusica3 = ControladorGlobal.desbloqueaMusica3
	partida.desbloqueaMusica4 = ControladorGlobal.desbloqueaMusica4
	partida.desbloqueaMusica5 = ControladorGlobal.desbloqueaMusica5
	partida.desbloqueaMusica6 = ControladorGlobal.desbloqueaMusica6
	ResourceSaver.save(partida, ruta)

func cargar_partida():
	print("partida resource path: ", partida.resource_path)
	print("cargamos partida")
	if ResourceLoader.exists(ruta):
		partida = load(ruta)
		print("nivel maximo: " + str(partida.nivel))
		ControladorGlobal.monedasTotales = partida.monedasTotales
		ControladorGlobal.nivel = partida.ultimoNiveljugado
		ControladorGlobal.nivelMaximo = partida.nivel
		ControladorGlobal.desbloqueaPersonaje2 = partida.desbloqueaPersonaje2
		ControladorGlobal.desbloqueaPersonaje3 = partida.desbloqueaPersonaje3
		ControladorGlobal.desbloqueaPersonaje4 = partida.desbloqueaPersonaje4
		ControladorGlobal.desbloqueaMusica2 = partida.desbloqueaMusica2
		ControladorGlobal.desbloqueaMusica3 = partida.desbloqueaMusica3
		ControladorGlobal.desbloqueaMusica4 = partida.desbloqueaMusica4
		ControladorGlobal.desbloqueaMusica5 = partida.desbloqueaMusica5
		ControladorGlobal.desbloqueaMusica6 = partida.desbloqueaMusica6
	
func borrarPartida():
	print("partida resource path: ", partida.resource_path)
	partida.nivel = 0
	partida.muertes = 0
	partida.ultimoNiveljugado = 1
	print("Monedas anteriores en partida: " +str(partida.monedasTotales))
	partida.monedasTotales = 0
	print("Monedas actuales en partida: " +str(partida.monedasTotales))
	partida.desbloqueaPersonaje2 = false
	partida.desbloqueaPersonaje3 = false
	partida.desbloqueaPersonaje4 = false
	ControladorGlobal.nivel = 1;
	ControladorGlobal.nivelMaximo = 0;
	ControladorGlobal.visibilidadSprite =0; 
	partida.desbloqueaMusica2 = false
	partida.desbloqueaMusica3 = false
	partida.desbloqueaMusica4 = false
	partida.desbloqueaMusica5 = false
	partida.desbloqueaMusica6 = false
	ResourceSaver.save(partida, ruta)
	print("antes de cargar: " + str(partida.nivel))
	cargar_partida()
	print("despues de cargar: "  + str(partida.nivel))
	

class_name ContenedorMonedas
extends Node


var totalMonedas: int
var monedasRecogidas: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var monedas := get_children() #otra forma de hacerlo, si metes las monedas dentro
	var monedas = get_tree().get_nodes_in_group("monedas")
	totalMonedas = monedas.size()  
	ControladorGlobal.resetearMonedas(monedas.size())
	for moneda in monedas:
		moneda.contenedorMonedas = self
	

func monedaRecogida():
	monedasRecogidas+=1
	ControladorGlobal.sumarMonedas()
	if monedasRecogidas == totalMonedas :
		ControladorGlobal.sumarNivel()
		print("nivel superado")
		get_parent().get_parent().siguienteNivel()

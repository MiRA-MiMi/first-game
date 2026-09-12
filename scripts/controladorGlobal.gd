extends Node

signal muertesActualizado
signal monedasActualizado

var nivel: int = 1
var nivelMaximo: int = 0
var monedasNivelCompletado: int
var monedasTotales: int
var monedasNivel: int
var muertes: int
var visibilidadSprite: int = 0
var desbloqueaPersonaje2: bool
var desbloqueaPersonaje3: bool
var desbloqueaPersonaje4: bool
var desbloqueaMusica2: bool
var desbloqueaMusica3: bool
var desbloqueaMusica4: bool
var desbloqueaMusica5: bool
var desbloqueaMusica6: bool
var menu_principal: String


func sumarMonedas():
	monedasTotales+=1
	monedasNivel+=1
	print("monedas totales: "+ str(monedasTotales))
	monedasActualizado.emit()
	
	

func sumarNivel():
	print("estamos sumando el nivel ahora es :" +str(nivel))
	nivel+=1
	print("Y lo dejamos en :" +str(nivel))

func sumarMuertes():
	print("muertes" + str(muertes))
	muertes+=1
	muertesActualizado.emit()

func resetearMuertes():
	muertes=0
	muertesActualizado.emit()
	
func resetearMonedas(numMonedas: int):
	monedasNivel=0
	monedasNivelCompletado= numMonedas
	monedasActualizado.emit()
	
func gastarDiezMonedas():
	monedasTotales= monedasTotales -10
	monedasActualizado.emit()
	

extends Panel

@export var textura : Array[CompressedTexture2D]
var colores: Array[Color] = [
	Color.html("e08eff47"), # rosa/morado
	Color.html("7eb8ff47"), # azul suave
	Color.html("ff7aa847"), # rojo suave
	Color.html("b0b0b047")  # gris suave
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_child(0).texture_normal = textura[ControladorGlobal.visibilidadSprite]
	var style = self.get_theme_stylebox("panel")
	style.bg_color = colores[ControladorGlobal.visibilidadSprite]
	self.add_theme_stylebox_override("panel", style)

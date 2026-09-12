extends TextureButton

var numeroSkin : int = 3
@export var texturaBloqueado: CompressedTexture2D
var texturaOriginal : CompressedTexture2D = self.texture_disabled

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ControladorGlobal.visibilidadSprite == numeroSkin:
		self.disabled = true
	else:
		self.button_pressed = false	
		self.modulate = Color(0.8, 0.8, 0.8, 1.0)
		
	if ControladorGlobal.desbloqueaPersonaje4:
		add_to_group("botones")
	else:
		self.modulate = Color.WHITE
		self.disabled = true
		self.texture_disabled = texturaBloqueado

func habilitar() -> void:
	add_to_group("botones")
	self.disabled = false
	self.button_pressed = false	
	self.modulate = Color(0.8, 0.8, 0.8, 1.0)
	self.texture_disabled =texturaOriginal


func _pressed() -> void:
	var botones = get_tree().get_nodes_in_group("botones")
	print(self.is_pressed())
	if self.is_pressed():
		ControladorGlobal.visibilidadSprite = numeroSkin
		self.disabled = true
		self.modulate = Color.WHITE
	for boton in botones:
		if boton != self:
			boton.button_pressed = false
			boton.disabled = false
			boton.modulate = Color(0.8, 0.8, 0.8, 1.0)

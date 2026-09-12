extends Button

@export var barmaidButton : TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ControladorGlobal.desbloqueaPersonaje4 == true:
		self.disabled = true
	else:
		if ControladorGlobal.monedasTotales <10:
			self.add_theme_color_override("font_color", Color.RED)
			self.add_theme_color_override("font_focus_color", Color.RED)
		else:
			self.add_theme_color_override("font_color", Color.GREEN)
			self.add_theme_color_override("font_focus_color", Color.GREEN)

func _process(_delta: float) -> void:
	if ControladorGlobal.monedasTotales <10 && self.disabled == false:
		self.add_theme_color_override("font_color", Color.RED)
		self.add_theme_color_override("font_focus_color", Color.RED)
	else:
		self.add_theme_color_override("font_color", Color.GREEN)
		self.add_theme_color_override("font_focus_color", Color.GREEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed() -> void:
	if ControladorGlobal.monedasTotales >=10:
		barmaidButton.habilitar()
		self.disabled = true
		ControladorGlobal.desbloqueaPersonaje4 = true
		ControladorGlobal.gastarDiezMonedas()

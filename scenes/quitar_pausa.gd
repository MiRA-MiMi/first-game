extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(pausa)


func pausa():
	print("Lanzamos pausa")
	var inputPausa = InputEventAction.new()
	inputPausa.action = "Pausa"
	inputPausa.pressed = true
	Input.parse_input_event(inputPausa)

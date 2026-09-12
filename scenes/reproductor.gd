extends AudioStreamPlayer2D

func _ready() -> void:
	finished.connect(eliminar)
	
func eliminar():
	queue_free()

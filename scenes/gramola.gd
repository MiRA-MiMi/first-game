extends AudioStreamPlayer
@export var songs: Array[AudioStream]

func _ready():
	cambiarCancion()
	
func cambiarCancion():
	if songs.is_empty():
		push_error("No hay canciones asignadas")
		return
	
	randomize()
	var song = songs[randi() % songs.size()]
	
	stream = song
	play()

extends RigidBody2D

@export var raycasts: Array[RayCast2D]

func _physics_process(_delta: float) -> void:
	for raycast in raycasts:
		if raycast.get_collider() != null:
			freeze = false;
	var pos = raycasts[0].target_position
	pos.y = 100.0   
	raycasts[0].target_position = pos
	

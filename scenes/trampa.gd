extends RigidBody2D

@export var raycasts: Array[RayCast2D]

func _physics_process(_delta: float) -> void:
	for raycast in raycasts:
		if raycast.get_collider() != null:
			freeze = false;


func disminuirRaycast():
	for raycast in raycasts:
		raycast.y =100;

	

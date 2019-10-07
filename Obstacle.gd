extends Area2D
var speed = 3

func _physics_process(delta):
	if global_position.x < 1920:
		position.x -= speed
	if global_position.x < -500:
		queue_free()
extends Sprite

func _physics_process(delta):
	position.x -= 3
	if position.x < -960:
		position.x = 2850
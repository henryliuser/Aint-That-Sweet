extends RigidBody2D
var frames = 0
func _process(delta):
	frames += 1
	if frames > 300:
		queue_free()

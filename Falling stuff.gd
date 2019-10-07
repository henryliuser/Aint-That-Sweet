extends RigidBody2D
var frames = 0
func _process(delta):
	frames += 1
	if frames > 300:
		var s = 100 * get_parent().multiplier
		get_parent().score += s
		get_parent().get_node("../Ground/Score").text = "Score: %d"%get_parent().get_node("../Spawner").score
		
		queue_free()
		


func _on_Area2D_body_entered(body):
	body.hurt()
	queue_free()

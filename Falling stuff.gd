extends RigidBody2D
var frames = 0
onready var heel = $heel
onready var bottle = $bottle

func _ready():
	var b = randi()%2
	if b == 0:
		heel.visible = false
	elif b == 1:
		bottle.visible = false

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

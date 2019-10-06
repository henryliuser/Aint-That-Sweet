extends Node2D
var frames = 0
var nextDelay = 60
func _ready():
	randomize()

func _process(delta):
	frames += 1
	if frames == nextDelay:
		frames = 0
		spawn()
		nextDelay = randi()%70 + 20

func spawn():
	var x = load("res://Falling stuff.tscn").instance()
	x.position = Vector2(randi()%1800+60, -300)
	x.linear_velocity.x = randi()%400 - 200
	x.angular_velocity = randi()%40 - 20
	add_child(x)
	

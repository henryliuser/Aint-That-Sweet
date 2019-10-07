extends Node2D
var frames = 0
var nextDelay = 60
var score = 0
var multiplier = 0.55
func _ready():
	randomize()
var b = 20
func _process(delta):
	frames += 1
	if frames % 5 == 0:
		b -= 1
	if b <= 0:
		b = 5
	if frames == nextDelay:
		frames = 0
		spawn()
		nextDelay = randi()%(b+50) + b

		

func spawn():
	var x = load("res://Falling stuff.tscn").instance()
	x.position = Vector2(randi()%1800+60, -300)
	x.linear_velocity.x = randi()%400 - 200
	x.angular_velocity = randi()%40 - 20
	add_child(x)
	
	

extends KinematicBody2D

var lastVel = Vector2()
var motion = Vector2(0,30)
var lerpWeight = 0.12
var acceleration = 25
var rot = 0
var maxSpeed = 700

func _ready():
	randomize()

func _physics_process(delta):
	print(motion.x)
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	if left and not right:
		motion += Vector2(-acceleration,0)
		rotation -= rot
	elif right and not left:
		motion += Vector2(acceleration,0)
		rotation += rot
	else:
		motion.x = lerp(motion.x, 0, lerpWeight)
	if abs(motion.x) < 1:
		motion.x = 0
	if abs(motion.x) > maxSpeed:
		motion.x = motion.x/abs(motion.x) * maxSpeed
	move_and_slide(motion, Vector2(0,-1))
	
	if Input.is_action_just_pressed("ui_accept"):
#		get_node("../club").modulate = Color(randi()%5 ,randi()%5,randi()%5 )
		get_node("../club").modulate = Color(0.8,0.5,0.1)
		rot += 0.02
		maxSpeed += 300
		acceleration /= 1.06
		lerpWeight -= 0.02
		if lerpWeight < 0.03:
			lerpWeight = 0.03



func _on_Area2D_body_entered(body):
	motion.x *= -0.5


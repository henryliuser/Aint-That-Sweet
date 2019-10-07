extends KinematicBody2D
var lastVel = Vector2()
var motion = Vector2(0,30)
var lerpWeight = 0.12
var acceleration = 25
var rot = 0
var maxSpeed = 700
var hp = 3

var hitstunTimer = 0
var hitstun = 20

func _ready():
	randomize()

func _physics_process(delta):
	print(motion.x)
	if (hitstunTimer == 0):
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
	else:
		hitstunTimer += 1
		if hitstunTimer > hitstun:
			hitstunTimer = 0
			modulate = Color(1,1,1,1)
	
	if Input.is_action_just_pressed("ui_accept"):
#		get_node("../club").modulate = Color(randi()%5 ,randi()%5,randi()%5 )
		get_node("../club").modulate = Color(0.8,0.5,0.1)
		get_node("../Spawner").multiplier += 0.2
		Global.updateMuney(-10)
		Global.updateHealth(-3)
		rot += 0.02
		maxSpeed += 300
		acceleration /= 1.06
		lerpWeight -= 0.02
		if lerpWeight < 0.03:
			lerpWeight = 0.03
			
	if Input.is_action_just_pressed("ui_cancel"):
		print("maxSpeed: %s\nacceleration: %s\nlerp: %s"%[maxSpeed, acceleration, lerpWeight])

func hurt():
	hp -= 1
	Global.updateHealth(2)
	get_node("../Ground/Label3").text = "HP: " + str(hp)
	if hp <= 0:
		Character1.updateAttraction(get_node("../Spawner").score/100)
		get_tree().change_scene("res://menu.tscn")
		
	hitstunTimer = 1
	modulate = Color(1,0,0)
	get_node("../Spawner").score /= 1.5
	get_node("../Spawner").score -= 150
	get_node("../Ground/Score").text = "Score: %d"%get_node("../Spawner").score
		
func _on_Area2D_body_entered(body):
	print(body)
	motion.x *= -0.5

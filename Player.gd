extends KinematicBody2D

var velocity = Vector2(0,0)
export var acceleration = 70
export var jumpSpeed = 800
var speedMultiplier = 1
var modCounter = 11
export var gravity = 35
export var maxAirVelocity = Vector2(450,1500)
export var maxVelocity = Vector2(400, 1500)
export var totalJumps = 2

const iframes = 60
var iTimer = 0
var invuln = false

var grounded = true
var midairJumpsLeft = totalJumps - 1
var anim

func _ready():
	gravity = 35
	anim = $AnimatedSprite
	
func _physics_process(delta):
	if position.y > 1200:
		getHurt(5000)
	imposeGravity()
	calculateJump()
	checkInvuln()
	movement()
	animate()
	velocity = move_and_slide(velocity*speedMultiplier, Vector2(0,-1))
	
func checkInvuln():
	if invuln:
		iTimer += 1
		if iTimer > iframes:
			invuln = false
			iTimer = 0

func imposeGravity():
	velocity.y += gravity

func calculateJump():
	if is_on_floor():
		grounded = true
		midairJumpsLeft = totalJumps-1
#	if is_on_ceiling():
#		velocity.y = 10
	else: 
		grounded = false

func parseInputs(lerpWeight):
	if Input.is_action_just_pressed("ui_up"):
		if midairJumpsLeft > 0 && not grounded:
			midairJumpsLeft -= 1
			velocity.y = -jumpSpeed 
		elif grounded:
			velocity.y = -jumpSpeed

	var crouch = Input.is_action_just_pressed("ui_down")
	
	if crouch:
		anim.play("crouch")
	
	var maxSpeeds
	if grounded: maxSpeeds = maxVelocity
	else: maxSpeeds = maxAirVelocity 
	
	velocity.y = min(velocity.y, maxSpeeds.y)
	
func movement():
	parseInputs(0.5)
	if abs(velocity.x) <= 1:
		velocity.x = 0
	if abs(velocity.y) <= 1:
		velocity.y = 0

func getHurt(dmg):
	modulate = Color(0.5,0,1,0.5)
	midairJumpsLeft = 0
	invuln = true
	modCounter = 0
	
func animate():
	if velocity.y < 0:
		anim.play("jump")
	elif velocity.y > 0:
		anim.play("fall")
	elif Input.is_action_pressed("player_crouch"):
		anim.play("crouch")
	else:
		anim.play("walk")
		
	modCounter += 1
	if modCounter > 10:
		modulate = Color(1,1,1,1)
		


func _on_Hitbox_area_entered(area):
	getHurt(10)

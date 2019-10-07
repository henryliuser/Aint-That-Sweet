extends Control

onready var healthLabel = $HUD/CanvasLayer/healthLabel
onready var muneyLabel = $HUD/CanvasLayer/muneyLabel
onready var HUD = $HUD
var muney = 0.0
var health = 100
var income = 0
var week = 1
var expense = 200

func _ready():
	updateHealth(0)
	updateMuney(0)

func updateHealth(diff):
	health += diff
	healthLabel.text = "HP: " + str(health)
	if health <= 0:
		healthLabel.text = "HP: 0"
		gameOver()

func updateMuney(diff):
	muney += diff
	muneyLabel.text = "$%.2f"%muney

func gameOver():
	pass
	
func updateWeek():
	week += 1
	updateMuney(income-expense)
	if muney <= 0:
		updateHealth(-30)
	get_tree().change_scene("res://menu.tscn")
	
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
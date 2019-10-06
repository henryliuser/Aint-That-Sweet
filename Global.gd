extends Control

onready var healthLabel = $HUD/healthLabel
onready var muneyLabel = $HUD/muneyLabel
onready var HUD = $HUD
var muney = 0.0
var health = 100
var week = 1

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
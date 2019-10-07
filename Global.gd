extends Control

onready var healthLabel = $HUD/CanvasLayer/healthLabel
onready var muneyLabel = $HUD/CanvasLayer/muneyLabel
onready var weekLabel = $HUD/CanvasLayer/weekLabel
onready var HUD = $HUD
var muney = 0.0
var health = 100
var income = 0
var week = 1
var expense = 200

var legend = ["neutral","angry","blush","surprised","happy"]

func hideHUD():
	healthLabel.visible = false
	muneyLabel.visible = false
	weekLabel.visible = false
	
func showHUD():
	healthLabel.visible = true
	muneyLabel.visible = true
	weekLabel.visible = true

func club():
	get_tree().change_scene("res://lol.tscn")
	Character1.visible = true
	Character2.visible = false
	Character3.visible = false

func park():
	get_tree().change_scene("res://lol.tscn")
	Character1.visible = false
	Character3.visible = true
	Character2.visible = false

func library():
	get_tree().change_scene("res://lol.tscn")
	Character1.visible = false
	Character3.visible = false
	Character2.visible = true



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
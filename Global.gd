extends Control

onready var healthLabel = $HUD/CanvasLayer/healthLabel
onready var muneyLabel = $HUD/CanvasLayer/muneyLabel
onready var weekLabel = $HUD/CanvasLayer/weekLabel
onready var HUD = $HUD
onready var curse = $HUD/CanvasLayer/Cursor
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
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func updateHealth(diff):
	health += diff
	healthLabel.text = "HP: " + str(health)
	if health <= 0:
		healthLabel.text = "HP: 0"
		gameOver()

func updateMuney(diff):
	muney += diff
	muneyLabel.text = "$%.2f"%muney
	var b = false
	if muney >= 20000:
		if Character1.attractionToPlayer > 80:
			b = true
		if Character2.attractionToPlayer > 80:
			b = true
		if Character3.attractionToPlayer > 80:
			b = true
		if b:
			get_tree().change_scene("res://BestEnding.tscn")
		else:
			get_tree().change_scene("res://MoneyEnding.tscn")
			

func gameOver():
	get_tree().change_scene("res://GameOver.tscn")
	

func reset():
	get_tree().change_scene("res://Opening.tscn")
	updateMuney(-muney)
	updateHealth(-health + 100)
	week = 1
	weekLabel.text = "WEEK 1"
	expense = 200
	income = 0
	Character1.reset()
	Character2.reset()
	Character3.reset()
	
	
func updateWeek():
	week += 1
	weekLabel.text = "Week " + str(week)
	updateMuney(income-expense)
	expense *= 1.2
	if muney <= 0:
		updateHealth(-30)
	get_tree().change_scene("res://menu.tscn")
	

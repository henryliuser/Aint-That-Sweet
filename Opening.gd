extends Control

onready var text1 = $text1
var t1 = ["The year is 2119. 100 years have passed since the legendary area 51 raid... aliens have fully integrated into society.",
		  "You are a human, an 18-year old University Student in the United States. Your parents have kicked you out of the house. You are on your own.",
		  "Education in America still costs a fortune.",
		  "Probability of survival: 17%",
		  "Unless..."
		 ]
var c1 = 0
var w1 = 0
var actualCounter = 0
var frames = 0

func _ready():
	Global.hideHUD()
	Character1.visible = false
	Character2.visible = false
	Character3.visible = false

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		actualCounter = 5
	if frames%3 == 0:
		if actualCounter < len(t1):
			if w1 == 0:
				text1.text += t1[actualCounter][c1]
				c1 += 1
				if c1 == len(t1[actualCounter]):
					c1 = 0
					w1 = 1
			elif w1 != 160:
				w1 += 1
				if w1 >= 80:
					w1 = 0
					actualCounter += 1
					text1.text = ""
		else:
			get_tree().change_scene("res://menu.tscn")
	frames += 1


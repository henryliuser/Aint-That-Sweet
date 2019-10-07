extends CanvasLayer
var h = 5
var s = 0
onready var score = $Score
onready var hp = $HP


func _process(delta):
	updateScore(1.5)

func updateHP(var dif):
	h += dif
	hp.text = "HP: %d"%h
	if h <= 0:
#		Character3.updateAttraction(int(s/100))
		if s<0:
			s = 0
		Summary.updateLabel(3,s, int(s/100))
		Global.curse.visible = true
		get_tree().change_scene("res://lol.tscn")
		Summary.visible = true

func updateScore(var dif):
	s += dif
	score.text = "Score: %d"%s

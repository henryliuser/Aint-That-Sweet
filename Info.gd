extends CanvasLayer

onready var score = $Score
onready var hp = $HP

func updateHP(var dif):
	hp += dif
	if hp <= 0:
		pass

func updateScore(var dif):
	score += dif

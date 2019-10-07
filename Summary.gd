extends Node2D
onready var label = $Label
func _ready():
	visible = false
	
func updateLabel(chara,score, delAttract):
	if score < 0:
		score = 0
	var s = ""
	var charaa
	if chara == 1:
		charaa = Character1
	elif chara == 2:
		charaa = Character2
	elif chara == 3:
		charaa = Character3
	s += "Score: %.2f\n"%score
	s += "Attraction Change: %d\n"%delAttract
	var a = delAttract+charaa.attractionToPlayer
	var b = charaa.attractionToPlayer
	s += "Income Change: %.2f\n"%(a*a*0.4637-(b*b*0.4637))
	s += "New Income: %.2f\n"% (a*a*0.4637)
	s += "\n"
	charaa.updateAttraction(delAttract)
	s += "Pre-Game Total:            $%4.2f\n"%Global.muney
	s += "+ Total Support:             $%4.2f\n"%Global.income
	s += "- Monthly Expenses:      $%4.2f\n"%Global.expense
	s += "--------------------------\n"
	s += "Balance for Next Week:   $%4.2f"%(Global.muney+Global.income-Global.expense)
	label.text = s

func _process(delta):
	if visible and Input.is_action_just_pressed("enter"):
		visible = false
		Global.updateWeek()
		

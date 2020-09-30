extends Control

onready var di = $Dialogue

func _unhandled_input(event):
	if event.is_action_pressed("ui_right"):
		$Tween.stop_all()
		di.percent_visible = 1

func changeText(var s):
	$Tween.stop_all()
	di.percent_visible = 0
	di.text = str(s) 
	$Tween.interpolate_property(di, "percent_visible", 0, 1, 3)
	$Tween.start()
func changeName(var s):
	$Name.text = str(s)

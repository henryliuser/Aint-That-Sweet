extends StaticBody2D
var bac = 0.0
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		bac += 0.014
		$Label4.text = "BAC: %.2f"%bac

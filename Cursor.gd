extends AnimatedSprite

func _process(delta):
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("ui_select"):
		play("default")



extends Sprite
var a = 3
var b = 2850

func _ready():
	Character3.visible = false
	Character1.visible = false
	Character2.visible = false

func _physics_process(delta):
	position.x -= a
	if position.x < -960:
		position.x = b
#		position.x = 2000
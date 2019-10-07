extends Control

onready var di = $Dialogue

func changeText(var s):
	di.text = str(s) 
func changeName(var s):
	$Name.text = str(s)
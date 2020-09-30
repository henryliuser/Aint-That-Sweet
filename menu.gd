extends Node2D
onready var club = $realmenu/Club/Label2
onready var park = $realmenu/Park/Label4
onready var library = $realmenu/Library/Label5
func _ready():
	Global.showHUD()
	Global.curse.visible = true
	Character1.visible = false
	Character2.visible = false
	Character3.visible = false


func _on_Club_pressed():
	Global.curse.play("default")
	if Character1.bigProgress >= 5:
		club.text = "BUSY"
		var x = Character1.attractionToPlayer
		Character1.updateAttraction(-(x/2))
	else:
		Global.club()

func _on_Park_pressed():
	Global.curse.play("default")
	if Character3.bigProgress >= 5:
		park.text = "BUSY"
		var x = Character3.attractionToPlayer
		Character3.updateAttraction(-(x/2))
	else:
		Global.park()

func _on_Library_pressed():
	Global.curse.play("default")
	if Character2.bigProgress >= 5:
		library.text = "BUSY"
		var x = Character2.attractionToPlayer
		Character2.updateAttraction(-(x/2))
	else:
		Global.library()


func _on_Library_mouse_entered():
	Global.curse.play("hover")
func _on_Library_mouse_exited():
	Global.curse.play("default")
func _on_Park_mouse_entered():
	Global.curse.play("hover")
func _on_Park_mouse_exited():
	Global.curse.play("default")
func _on_Club_mouse_entered():
	Global.curse.play("hover")
func _on_Club_mouse_exited():
	Global.curse.play("default")


func _on_Club2_pressed():
	get_tree().quit()

extends Node2D
onready var realmenu = $realmenu
func _ready():
	Global.showHUD()
	
	Character1.visible = false
	Character2.visible = false
	Character3.visible = false


func _on_Club_pressed():
	realmenu.visible = false
	Global.club()

func _on_Park_pressed():
	realmenu.visible = false
	Global.park()

func _on_Library_pressed():
	realmenu.visible = false
	Global.library()

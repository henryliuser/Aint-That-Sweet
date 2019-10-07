extends Node2D

onready var infoLabel = $Info/InfoLabel
onready var infoLabel2 = $Info/InfoLabel2
onready var info = $Info
onready var anim = $AnimatedSprite
var attractionToPlayer = 0
var support = 0.0

var lines = [

[
[1, "Fancy seeing you here…"],
["1. Do I know you?\n2. Who are you?"],
[2, "That information is for me to know"],
["No seriously, do I know you?", "Have I seen you before?"],
[5, "You may recognize me from the time I was on national television for my world record"],
["1. World record! What do you have the record for?\n2. Was it one of those stupid records or an actually impressive one?"],
[2, "The details of my record, though I no longer have it, are private."],
["1. No longer have it? Why?\n2. Private huh ;)"],
[3, "I must go. Goodbye"],
["*You chase after him as he runs away. Luckily for you, he runs at an incredibly average pace"]
],

[
[1, "It’s you again."],
["Oh it’s world record boy. You know, I scoured an entire book of world records, and all I could find was your first name"],
[3, "You found my name! I swore long ago that nobody would ever discover that I was called Brian"],
["1. Oh your name is Brian? Good to know\n2. Get tricked sucker I know your name now"],
[2, "I can’t believe that I was fooled by a simpleton like you"],
["1. Remind me Mr. Brian, which one of us just got fooled?\n2. No you"],
[2, "I need not put up with this idiocy. I shall be on my way now."],
["1. Wait no I want to get to know you better don’t leave yet\n2. I’m not going to let you leave that easily"],
[5, "Oh my god do you really mean that"],
["1. That’s kind of weird dude I’m going to go now\n2. Of course I do but I need to go home now sorry\n*you hurry off with Brian in hot pursuit*"],
],

[
[2, "You sure ran off real fast last time"],
["1. Yeah you were weird\n2. Sorry I was in a rush"],
[1, "Don’t worry, I understand. I had to make many speedy escapes back in my day"],
["1. Tell me more\n2. What could you possibly have to escape from?"],
[3, "Ahh, you’re making me think of the good old days… I can barely remember the last time I robbed a vault"],
["1. Stop fronting my guy\n2. There’s no way you actually robbed vaults"],
[4, "Ah, I have said too much already. But alas, there are the cops. I must flee. If you want to hear more, come with me"],
["1. Yes\n2. Even more Yes"]
],
[
[1, "I see you have returned"],
["1. Not for you\n2. I’m glad you can see things with your weird eyes"],
[2, "I’ll have you know, yesterday, my fortnite plays received more than 3000 likes. Commentators called them 300iq."],
["1. What’s fortnite\n2. Why would I care about this"],
[1, "Ah… Silly girl. It’s ok. One day you will understand"],
["1. When’s that day going to come\n2. I doubt I will"],
[5, "Walk with me. I shall explain"]
],

[
[1, "Oh there you are"],
["1. Where?\n2. Where else would I be?"],
[2, "I am going to ignore your sass this time. I am sorry to say that we will probably not see each other after today."],
["1. Yayyyyyy\n2. Oh no why :((("],
[5, "Hush you. This is my moment. You can react later. This is the sad tale of why I must return to my home."],
["1. Where’s that\n2. Why do you need to leave"],
[1, "That is not for you to know. My bus is here. Goodbye"],
["*You watch as Brian leaves. It suddenly strikes you that you never got his last name. As you watch him disappear over the horizon, you are struck by the sudden urge to learn his last name and begin a speedy pursuit*"]
]
]

#               name   occupation  netWorth  origin  funFact1  funFact2  nickname  badThing1 badThing2 
var infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
var infoValues = ["Brian",
				  "Vault Robber",
				  "somewhere in the billions, probably",
				  "No one knows",
				  "300 IQ plays",
				  "Former World Record Holder for Most Rubik's Cube Solved while doing a handstand",
				  "Brian",
				  "Mysterious, doesn't open up about himself.",
				  "Intensely average in most regards"]
				
var infoLabels = ["Name: ", "Occupation: ", "Net Worth: ", "Place of Origin: ", "Fun Fact #1: ",
				  "Fun Fact #2: ", "Nickname: ", "Drawback #1:", "Drawback #2: "]

func _ready():
	$TextBox.changeText(lines[0][0][1])
	$TextBox.changeName(infoValues[0])

func showInfo():
	if bigProgress == 1:
		infoBool[5] = true
		infoBool[7] = true
	if bigProgress == 2:
		infoBool[0] = true
		infoBool[6] = true
	if bigProgress == 3:
		infoBool[1] = true
		infoBool[2] = true
	if bigProgress == 4:
		infoBool[4] = true
		infoBool[8] = true
	info.visible = true
	infoLabel2.visible = false
	infoLabel.visible = true
	var s = ""
	for v in range(0,9):
		s += infoLabels[v] 
		if infoBool[v]:
			s += infoValues[v]
		else: 
			s += "????"
		s += "\n"
	infoLabel.text = s

func updateAttraction(var u):
	attractionToPlayer += u
	Global.income -= support
	support = attractionToPlayer * attractionToPlayer * 0.4637
	Global.income += support
	


func nextPage():
	infoLabel.visible = false
	infoLabel2.text = "Their attraction to You: %d\nMonthly support: $%.2f"%[attractionToPlayer,support]
	infoLabel2.visible = true

func hideInfo():
	info.visible = false
	Global.curse.play("default")


var hisTurn = true 
var bigProgress = 0
var progress = 0
func _process(delta):
	if visible:
		if hisTurn and Input.is_action_just_pressed("ui_accept"):
			dialogo()
		if not hisTurn and Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			dialogo()

func reset():
	progress = 0
	bigProgress = 0
	attractionToPlayer = 0
	support = 0
	hisTurn = true
	$TextBox.changeText(lines[0][0][1])
	$TextBox.changeName(infoValues[0])
	infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
	

func dialogo():
	progress += 1
	if progress >= len(lines[bigProgress]):
		bigProgress += 1
		progress = 0
		visible = false
		hisTurn = true
		if bigProgress < len(lines):
			$TextBox.changeText(lines[bigProgress][progress][1])
			$TextBox.changeName(infoValues[0])
			anim.play(Global.legend[lines[bigProgress][progress][0]])
		get_tree().change_scene("res://ParkGame.tscn")
	else:
		var arr = lines[bigProgress][progress]
		if hisTurn: #sets up your turn 
			hisTurn = false
			anim.play("me")
			$TextBox.changeName("Me")
			$TextBox.changeText(arr[0])
		else:
			hisTurn = true
			$TextBox.changeText(arr[1])
			$TextBox.changeName(infoValues[0])
			anim.play(Global.legend[arr[0]-1]) 

func _on_Button_mouse_entered():
	Global.curse.play("hover")
func _on_Button_mouse_exited():
	Global.curse.play("default")
func _on_Next_mouse_entered():
	Global.curse.play("hover")
func _on_Hide_mouse_entered():
	Global.curse.play("hover")
func _on_Next_mouse_exited():
	Global.curse.play("default")
func _on_Hide_mouse_exited():
	Global.curse.play("default")

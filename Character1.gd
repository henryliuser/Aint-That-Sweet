extends Node2D

onready var infoLabel = $Info/InfoLabel
onready var infoLabel2 = $Info/InfoLabel2
onready var info = $Info
onready var anim = $AnimatedSprite
var attractionToPlayer = 0
var support = 0.0

var lines = [

[
[1, "Hey girl, I don’t know you, but I want you to know something. I am so goddamn fast"],
["1. How fast?\n2. Who are you?"],
[5, "I’m so glad you asked. Some background information: I was the speediest runner in my entire state in high school. I ran a mile in under 4 minutes. If we were being chased by a bear, me as a 16 year old could have escaped while you were being eaten"],
["1. Nice\n2. Oh my god can I get your autograph?"],
[1, "Sorry I can’t hear you over the music. I must go dance now because my incredibly powerful legs cannot stay still for too long"],
["*You follow the guy through the crowd, but he is too fast and get lost. It is all you can do to avoid the obstacles falling from the ceiling as you look for him*"]
],

[
[4, "Oh hey i remember you! You caught up to me!"],
["1. You’re not the only fast one here ;)\n2. Maybe I’ll go fast enough to get in front of you"],
[2, "Ha. That’s funny. The last time someone placed in front of me in a race was years ago, and only because I got disqualified. Goddamn referees"],
["1. what\n2. Yeah I totally feel you referees suck"],
[1, "Anyways I gotta dash. See ya around if you get lucky"],
["1. Wait what’s your name?\n2. What do you mean lucky???"],
[1, "You worry too much. Call me Jakobius."],
["*You watch Jakobius dash off. You get up to go home, but are suddenly pulled on to the dance floor by the wind caused by Jakob’s fast running. You see him dancing out of the corner of your eye and decide to try and get into it too*"]
],

[
[1, "Hello"],
["1. You’re talking slower than usual\n2. Why so few words today?"],
[4, "I didn’t expect you to notice. I am a little down in the dumps today because my net worth dropped earlier"],
["1. Oh no, what happened?\n2. How much money is left?"],
[1, "It’s too late to do anything now, but I only have 4.3 million dollars left. I was too slow :("],
["1. That sounds like enough to buy me a drink\n2. Ok rich boy stop complaining"],
[3, "I’ll do that if you dance with me"]
],

[
[1, "Sometimes I feel like you go to the club too often"],
["1. I am at the club at literally the same times you do\n2. Maybe I do but seeing you makes it worth it ;)"],
[5, "I know, but still. You’re not as fast as me so it costs more to you"],
["1. I get it, you’re fast\n2. Are you really even that fast?"],
[5, "My friends in Arkansas used to call me rabbit because I was so fast. I am the human embodiment of speed"],
["1. Are you sure that’s why\n2. Are rabbits even fast?"],
[2, "For someone who looks so slow, you sure seem cocky. Try and keep up"],
["*You try and keep up. He is too fast and you get stuck in the crowd again*"]
],

[
[2, "*mutter mutter* You can do it Jakob it doesn’t matter that you’re a virgin *mutter mutter*"],
["1. What’d you just say?\n2. Were you talking to me?"],
[3, "Oh I didn’t see you there sorry. I was just talking to myself, it wasn’t important"],
["1. Mhm\n2. Sure…"],
[3, "Either way, I’ve been meaning to do this for a while. Wanna dance?"],
["1. Yes\n2. I mean what’s the worst thing that could happen"]
]

]
#               name   occupation  netWorth  origin  funFact1  funFact2  nickname  badThing1 badThing2 
var infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
var infoValues = ["Jakobius Inglewood",
				  "Professsional Runner",
				  "4.3 Million USD",
				  "Arkansas",
				  "Fastest kid in his state, ran sub-4 in high school.",
				  "He was disqualified at the national championships.",
				  "Rabbit",
				  "Virgin",
				  "Arrogant"]
				
var infoLabels = ["Name: ", "Occupation: ", "Net Worth: ", "Place of Origin: ", "Fun Fact #1: ",
				  "Fun Fact #2: ", "Nickname: ", "Drawback #1:", "Drawback #2: "]

func _ready():
	$TextBox.changeText(lines[0][0][1])
	$TextBox.changeName(infoValues[0])
	$Tween.repeat = true
	var p = $AnimatedSprite.position.y
	$Tween.interpolate_property($AnimatedSprite, "position:y", 
		p+20, p-20, 1.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($AnimatedSprite, "position:y", 
		p-20, p+20, 1.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 1.5)
	$Tween.start()
	

func showInfo():
	if bigProgress == 1:
		infoBool[8] = true
		infoBool[4] = true
	if bigProgress == 2:
		infoBool[0] = true
		infoBool[5] = true
		infoBool[6] = true
	if bigProgress == 3:
		infoBool[3] = true
		infoBool[6] = true
	if bigProgress == 4:
		infoBool[7] = true
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
		if not hisTurn and (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")):
			dialogo()

#func reset():
#	hisTurn = true
#	$TextBox.changeName(infoValues[0])
#	$TextBox.changeText(lines[bigProgress][progress][1])
#	anim.play(Global.legend[lines[bigProgress][progress][0]-1]) 

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
		get_tree().change_scene("res://ClubGame.tscn")
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
	
func reset():
	progress = 0
	bigProgress = 0
	attractionToPlayer = 0
	support = 0
	hisTurn = true
	$TextBox.changeText(lines[0][0][1])
	$TextBox.changeName(infoValues[0])
	infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
	 
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

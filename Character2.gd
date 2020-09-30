extends Node2D

onready var infoLabel = $Info/InfoLabel
onready var infoLabel2 = $Info/InfoLabel2
onready var info = $Info
onready var anim = $AnimatedSprite
var attractionToPlayer = 0
var support = 0.0

var lines = [

[ 
[3, "hey uh… you’re sitting kinda close to me"],
["1. Oh whoops I didn’t notice\n2. Do you mind? ;)" ],
[1, "sorry its just that I’ve never been this close to a girl before. I’m Brock. Brock lee"],
["1. Leeser (loser plus lee haha get it)\n2. Loser"],
[4, "oh :("],
["1. Sorry, I didn’t mean to be mean, let me make it up to you\n2. Sorry I didn’t mean to be mean, let me make it up to you ;)"],
[5, "oh….. I’m good its ok"],
["1. Sorry that was a bad first impression. Let’s try again. What are you doing right now?\n2. Ok. Whatcha doing?"],
[5, "oh this little thing? I’m just recompiling the binaries for this package"],
["1. Leeser\n2. Loser"],
[2, "ok I’ll be going if that’s all you have to say"],
["1. Ok I’m seriously sorry this time let me write you a letter to prove it\n2. Don’t leave let me write you an apology note"]
],

[
[4, "it’s you again"],
["1. Hey brock\n2. What’s up"],
[1, "I didn’t think I’d run into anyone I knew twice here"],
["1. Well I’m glad you’re here\n2. Hehe do I know you? ;)"],
[3, "well i have to do homework, so if you’re trying to socialize you should probably go somewhere else"],
["Oh i have work too we should sit together", "You can sit here ;)"],
[1, "Ok"],
["1. By the way, where are you from?\n2. I’ve never seen a face like yours before… Where’d you get it"],
[4, "That’s very up front of you. I’m from China"],
["1. Oh one of those. Can you help me with this?\n2. Yes. Watch this"],
[4, "*falls over backwards in shock*"],
["1. Oh my god I’m so sorry\n2. Imagine not having any balance hahahahahahaha"],
[2, "you made me mess up my english homework"],
["1. Oh no I’m sorry let me redo it for you\n2. It looks easy stop complaining just watch how fast I do it"]
],

[
[4, "you’re back??"],
["1. No\n2. Yes"],
[2, "are you following me?"],
["1. No\n2. Yes"],
[2, "...ok. I’m gonna move over there"],
["1. Wait let me come with you\n2. You forgot this"],
[1, "what?"],
["1. Take this before you leave, even if you must leave me behind\n2. Take this"],
[1, "what is it"],
["1. it’s a note I wrote for you\n2. Secret ;)"],
[4, "ok lemme have it"],
["*write the note really fast before he notices that you haven’t written it yet*"]
],

[
[1, "hey"],
["Hey I’m back"],
[5, "hey back I’m Brock"],
["1. Ha ha hee hee hoo hoo\n2. Hey Brock I’m back"],
[5, ":)"],
["1. I have had an interesting week\n2. What have you been doing all week?"],
[1, "my week was pretty boring. What happened to you?"],
["1. I almost got abducted by aliens!!! I was so scared\n2. Pirates tried shipping me to China"],
[2, "if i knew you were going to lie to me i wouldn’t have asked"],
["1. No i swear its the truth\n2. Do I look like I would lie to you?"],
[1, "uh huh."],
["1. Look i have proof\n2. Fine. I won’t show you the note they left me"],
[4, "show me"], 
["uhhhhhh i just gotta find it *commence speed forgery*"]
],

[
[3, "You came back"],
["1. I am back\n2. Just for you ;)"],
[5, "Thanks. I was wondering if you’d come this time"],
["1. Of course I’d come Brocko\n2. Well you sure got lucky didn’t you Brocky"],
[4, "Nobody’s ever called me that before. If they’re not calling me Brock, my friends call me Colin Flowers"],
["1. Why?\nHbahdbaha what’d you do to get that nickname"],
[1, "I’m not sure what started it, but after I won Ludum Dare 45, my friends decided the name Colin would fit me"],
["1. You won Ludum Dare 45 :0\n2. How did someone like you manage to win something like that?"],
[5, "Of course I won. I was the first alien to become USACO Platinum after all"],
["1. Stop flexing so hard. I got a love letter from the president\n2. I knew you were super smart… You must be rich too.. I wonder if it’s finally time to give you the love letter I wrote you when we first met"],
[4, "what letter???"],
["*gogogogogo*"]
]

]

#               name   occupation  netWorth  origin  funFact1  funFact2  nickname  badThing1 badThing2 
var infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
var infoValues = ["Brock Lee",
				  "Software Engineer",
				  "$704,836.86",
				  "China (They had aliens all along)",
				  "First extraterrestrial to achieve USACO Platinum.",
				  "Won Ludum Dare 45 2019",
				  "Colin Flowers",
				  "Awkward",
				  "Shy"]
				
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
		infoBool[0] = true
		infoBool[1] = true
		infoBool[7] = true
		infoBool[8] = true
	if bigProgress == 2:
		infoBool[3] = true
		infoBool[6] = true
	if bigProgress == 3:
		infoBool[1] = true
		infoBool[2] = true
	if bigProgress == 4:
		infoBool[4] = true
		infoBool[5] = true
		infoBool[6] = true
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


onready var hisTurn = true 
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
		get_tree().change_scene("res://LibraryGame.tscn")
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

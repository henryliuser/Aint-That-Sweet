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
["1. Oh whoops I didn’t notice\n2. something" ],
[1, "sorry its just that I’ve never been this close to a girl before. Im brock. Brock lee"],
["1. Leeser (loser plus lee haha get it)\n2. Loser"],
[4, "oh :("],
["1. Sorry, I didn’t mean to be mean, let me make it up to you\n2. Sorry I didn’t mean to be mean, let me make it up to you ;)"],
[5, "oh….. I’m good its ok"],
["1. Sorry that was a bad first impression. Let’s try again. What are you doing right now?\n2. Ok. Whatcha doing?"],
[5, "oh this little thing? I’m just recompiling the binaries for this package"],
["1. Leeser\n2. Loser"],
[2, "ok I’ll be going if that’s all you have to say"],
["1. Ok I’m seriously sorry this time let me write you a letter to prove it\n2. Don’t leave let me write you an apology note"]
]
]




#               name   occupation  netWorth  origin  funFact1  funFact2  nickname  badThing1 badThing2 
var infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
var infoValues = ["Jakobius Inglewood",
				  "Professsional Runner",
				  "4.3 Million USD",
				  "Norway",
				  "He was the first highschooler to run a sub-4 mile. Did it when he was 16.",
				  "He was almost disqualified at Doha World Championships 2019",
				  "Rabbit",
				  "Virgin",
				  "Arrogant"]
				
var infoLabels = ["Name: ", "Occupation: ", "Net Worth: ", "Place of Origin: ", "Fun Fact #1: ",
				  "Fun Fact #2: ", "Nickname: ", "Drawback #1:", "Drawback #2: "]

func _ready():
	$TextBox.changeText(lines[0][0][1])

func showInfo():
	info.visible = true
	infoLabel2.visible = false
	infoLabel.visible = true
	var s = ""
	for v in range(0,8):
		s += infoLabels[v] 
		if infoBool[v]:
			s += infoValues[v]
		else: 
			s += "????"
		s += "\n"
	infoLabel.text = s

func updateAttraction(var u):
	attractionToPlayer += u
	support = attractionToPlayer * attractionToPlayer * 0.5637


func nextPage():
	infoLabel.visible = false
	infoLabel2.text = "Their attraction to You: %d\nMonthly support: $%.2f"%[attractionToPlayer,support]
	infoLabel2.visible = true

func hideInfo():
	info.visible = false


var hisTurn = true 
var bigProgress = 0
var progress = 0
func _process(delta):
	if visible:
		if hisTurn and Input.is_action_just_pressed("ui_accept"):
			dialogo()
		if not hisTurn and Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
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
		visible = false
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
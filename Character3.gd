extends Node2D

onready var infoLabel = $Info/InfoLabel
onready var infoLabel2 = $Info/InfoLabel2
onready var info = $Info

var progress = 0
var attractionToPlayer = 0
var support = 0.0

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



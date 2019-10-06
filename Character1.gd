extends Node2D

onready var infoLabel = $Info/InfoLabel
onready var infoLabel2 = $Info/InfoLabel2
onready var info = $Info

var attractionToPlayer = 0
var playerAttractionTo = 0

#               name   occupation  netWorth  origin  funFact1  funFact2  nickname  badThing1 badThing2 
var infoBool = [false,   false,     false,   false,   false,    false,    false,    false,    false]
var infoValues = ["Jakob Ingebrigsten",
				  "Professsional Runner",
				  "4.3 Million USD",
				  "Norway",
				  "He was the first highschooler to run a sub-4 mile. Did it when he was 16.",
				  "He was disqualified at Doha World Championships 2019",
				  "Rabbit",
				  "Virgin",
				  "Arrogant"]
				
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

func nextPage():
	infoLabel.visible = false
	infoLabel2.visible = true

func hideInfo():
	info.visible = false



extends Node2D

var inputWord
var currentWord
var copyText
var copiedText = ""
var score  = 0
var textFiles = ["res://Graphics/poem1.txt","res://Graphics/poem2.txt","res://Graphics/poem3.txt","res://Graphics/poem4.txt","res://Graphics/poem5.txt"]
var allWords
var index = 0

func _ready():
	$UserInput.grab_focus()
	Global.curse.visible = false
	Character3.visible = false
	Character1.visible = false
	Character2.visible = false
	randomize()
	var file = File.new()
	file.open(textFiles[randi()%5],File.READ)
	copyText = file.get_as_text()
	file.close()
	allWords = copyText.split(" ")
	$CopyText.text = copyText
	currentWord = allWords[index]
	$CurrWord.text = "Type " + currentWord

var time = 0
func _process(delta):
	time += delta
	$Time.text = "%.2f"%time
	if Input.is_action_just_pressed("ui_accept"):
		inputWord = $UserInput.text
		currentWord += " "
		copiedText += inputWord
		copiedText += " "
		$CopiedText.text = copiedText
		var correctLength = currentWord.length()
		var userLength = inputWord.length()
		score += currentWord.similarity(inputWord)
		print(score)
		$Score.text = "%.2f"%score
		$UserInput.text = ""
		index += 1
		if index >= len(allWords):
#			Character2.updateAttraction(int(score/time*13))
			Summary.updateLabel(2,int(score/time), int(score/time*13))
			Global.curse.visible = true
			get_tree().change_scene("res://lol.tscn")
			Summary.visible = true
		else:
			currentWord = allWords[index]
			currentWord = currentWord.replace("\n","")
			$CurrWord.text = "Type " + currentWord
		
		
	
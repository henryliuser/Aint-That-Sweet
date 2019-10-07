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
	randomize()
	var file = File.new()
	file.open(textFiles[randi()%5],File.READ)
	copyText = file.get_as_text()
	file.close()
	allWords = copyText.split(" ")
	$CopyText.text = copyText
	currentWord = allWords[index]
	$CurrWord.text = "Type " + currentWord

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		currentWord = allWords[index]
		inputWord = $UserInput.text
		copiedText += inputWord
		copiedText += " "
		$CopiedText.text = copiedText
		var correctLength = currentWord.length()
		var userLength = inputWord.length()
		score += currentWord.similarity(inputWord)
		index += 1
		print(score)
		$UserInput.text = ""
		$CurrWord.text = "Type" + currentWord
		
	
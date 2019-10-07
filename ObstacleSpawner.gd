extends Node2D

export var spawned = ["res://Bench.tscn", "res://Dog.tscn", "res://Frisbee.tscn"]
export var delay = 300
var currTime = 300

func _ready():
	randomize()
	
var b = 180
var f = 0
func _process(delta):
	currTime += 1
	f += 1
	if f%5 == 0:
		b -= 1
		f = 0
	if currTime >= delay:
		delay = randi()%b + 50
		if b < 50: 
			b = 50
		
		currTime = 0
		var obstacleNum = randi()%3
		var enemy = load(spawned[obstacleNum]).instance()
		enemy.global_position.x = 1919
		if(obstacleNum < 2):
			enemy.global_position.y = 900
		else:
			enemy.global_position.y = randi()%500 + 200
		if obstacleNum > 0:
			enemy.speed = randi()%12 + 5
		get_parent().add_child(enemy)

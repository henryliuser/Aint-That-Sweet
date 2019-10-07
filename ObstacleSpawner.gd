extends Node2D

export var spawned = ["res://Bench.tscn", "res://Dog.tscn", "res://Frisbee.tscn"]
export var delay = 300
var currTime = 300

func _ready():
	randomize()
	

func _process(delta):
	currTime += 1
	if currTime >= delay:
		delay = randi()%300
		while delay < 60:
			delay = randi()%300
		currTime = 0
		var obstacleNum = randi()%3
		var enemy = load(spawned[obstacleNum]).instance()
		enemy.global_position.x = 1919
		if(obstacleNum < 2):
			enemy.global_position.y = 900
		else:
			enemy.global_position.y = randi()%500 + 200
		if obstacleNum > 0:
			enemy.speed = randi()%5 + 2
		get_parent().add_child(enemy)

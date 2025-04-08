extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var loop = 1
var moving : bool = false
var speed = 0
var movingspeed = 150
@export var player : CharacterBody2D


func _process(delta):
	if loop == 1 and moving == false:
		if rng.randi_range(1, 50) == 50:
			Spawn()
		
	
func  _physics_process(delta: float):
	if global_position.x < -100:
		moving = false
		global_position.x = 2000
		speed = 0
	else:
		global_position.x += -speed * delta

func Spawn():
	moving = true
	print("I HAVE SPAWEDN")
	global_position.x = 1400
	speed = movingspeed

func resetUFO():
	print("I HAVE DIES AND POWERUP")
	#player.Powerup(rng.randi_range(1, 4))
	player.Powerup(2) 
	moving = false
	global_position.x = 2000
	speed = 0

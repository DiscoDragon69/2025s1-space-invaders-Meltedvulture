extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var loop = 1
var moving : bool = false
var speed = 0
var movingspeed = 150
@export var player : CharacterBody2D


func _ready():
	ufoLoop()

func  _physics_process(delta: float):
	if global_position.x < -100:
		moving = false
		global_position.x = 2000
		speed = 0
	else:
		global_position.x += -speed * delta

func Spawn():
	moving = true
	#print("I HAVE SPAWEDN")
	global_position.x = 1400
	speed = movingspeed

func resetUFO():
	#print("I HAVE DIES AND POWERUP")
	player.Powerup(rng.randi_range(1, 3))
	#player.Powerup(3) 
	moving = false
	global_position.x = 2000
	speed = 0

func ufoLoop():
	await get_tree().create_timer(1).timeout
	if moving == false:
		if rng.randi_range(1, 25) == 15:
			Spawn()
	ufoLoop()

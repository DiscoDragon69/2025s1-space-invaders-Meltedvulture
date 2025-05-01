extends Node2D


var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	gridMove()

func _physics_process(delta):
	pass
	
func gridMove():
	speed = GlobalVariables.enemySpeed
	global_position.x += speed
	await get_tree().create_timer(0.25).timeout
	gridMove()

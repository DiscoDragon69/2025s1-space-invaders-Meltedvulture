extends Node2D


var speed = -100


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


func _physics_process(delta):
	global_position.x += speed * delta
	

extends Node2D

var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyReference = self


func gridMove():
	speed = GlobalVariables.enemySpeed + GlobalVariables.Level
	global_position.x += speed


func _on_timer_timeout():
	gridMove()

extends Node2D

var adjustedTimer : float
var speed
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = GlobalVariables.enemySpeed
	GlobalVariables.enemyReference = self
	GlobalVariables.sceneChange.connect(sceneUpdate)
	gridMove()


func gridMove():
	if GlobalVariables.hardMode == true:
		adjustedTimer = clampf(0.25 - (float(GlobalVariables.Level) / 50), 0.01, 0.5)
	else:
		adjustedTimer = clampf(0.25 - (float(GlobalVariables.Level) / 75), 0.025, 0.5)
	speed = GlobalVariables.enemySpeed
	global_position.x += speed
	timer.start(adjustedTimer)
	await timer.timeout
	gridMove()

func sceneUpdate():
	queue_free()

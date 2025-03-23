extends Control

@export var countdown_max: int = 60
var current_timer


# Called when the node enters the scene tree for the first time.
func _ready():
	current_timer = countdown_max
	$HUD/Countdown.text = str(current_timer)
	
	while current_timer > 0:
		await get_tree().create_timer(1).timeout
		current_timer -= 1
		$HUD/Countdown.text = str(current_timer)
	get_tree().change_scene_to_file("res://Lose-Scene.tscn")
	print("Game Over")
	
func _process(delta):
	$HUD/Health.update_health($Player.health)
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene_to_file("res://WinScene.tscn")

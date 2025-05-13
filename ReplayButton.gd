extends Button



func _on_pressed() -> void:
	GlobalVariables.Level = 1
	GlobalVariables.playerHealth = 5
	get_tree().change_scene_to_file("res://MainGame/MainGame.tscn")

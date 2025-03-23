extends CharacterBody2D


var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.bulletInstanceCount += 0
	set_physics_process(true)


func _physics_process(delta):
	var collidedobject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedobject):
		if "Enemy" in collidedobject.get_collider().name:
			collidedobject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] +=10
			# MY Enemy count code cause yeah
			#GlobalVariables.enemyCount -= 1
			#print(GlobalVariables.enemyCount)
			#if GlobalVariables.enemyCount < 1:
				#get_tree().change_scene_to_file("res://Menu/Menu.tscn")
		
		queue_free()
		GlobalVariables.bulletInstanceCount -= 1

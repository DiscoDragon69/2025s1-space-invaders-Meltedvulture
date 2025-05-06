extends CharacterBody2D


var speed = GlobalVariables.bulletSpeed
var rng = RandomNumberGenerator.new()
var speedX = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.bulletInstanceCount += 1
	set_physics_process(true)


func tripleShotMovement(Direction):
	speedX = Direction

func _physics_process(delta):
	var collidedobject
	if GlobalVariables.fireflyShot == true:
		collidedobject = move_and_collide(Vector2(rng.randf_range(-24, 24), -speed*delta))
	else:
		collidedobject = move_and_collide(Vector2(speedX, -speed*delta))

	if (collidedobject):
		if "Enemy" in collidedobject.get_collider().name:
			collidedobject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] += 10
			GlobalVariables.mainGame.newRound()
			# MY Enemy count code cause yeah
			#GlobalVariables.enemyCount -= 1
			#print(GlobalVariables.enemyCount)
			#if GlobalVariables.enemyCount < 1:
				#get_tree().change_scene_to_file("res://Menu/Menu.tscn")

		if "Shield" in collidedobject.get_collider().name:
			collidedobject.get_collider().queue_free()
		
		#UFO Checking
		if "UFO" in collidedobject.get_collider().name:
			collidedobject.get_collider().resetUFO()  
			
		if "Upgrade Ship" in collidedobject.get_collider().name:
			collidedobject.get_collider().activateUpgrade()

		GlobalVariables.bulletInstanceCount -= 1
		queue_free()

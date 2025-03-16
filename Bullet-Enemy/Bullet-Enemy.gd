extends CharacterBody2D


var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)

func _physics_process(delta):
	var collided_object = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collided_object):
		if "Enemy" in collided_object.get_collider().name:
			pass
		elif "Player" in collided_object.get_collider().name:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1

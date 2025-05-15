extends CharacterBody2D


var speed = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	speed += GlobalVariables.Level * 50
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)

func setType(type):
	if type == "fast":
		modulate = Color(0, 255, 0)
		speed += 100
	elif type == "mega":
		modulate = Color(255, 0, 0)
		scale.x += 3



func _physics_process(delta):
	var collided_object = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collided_object):
		if "Player" in collided_object.get_collider().name:
			GlobalVariables.enemyBulletInstanceCount -= 1
			collided_object.get_collider().change_health(-1)
		else:
			GlobalVariables.enemyBulletInstanceCount -= 1
		queue_free()

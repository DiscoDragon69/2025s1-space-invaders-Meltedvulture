extends CharacterBody2D


var speed = 500
var rng = RandomNumberGenerator.new()
var Xvel = rng.randf_range(-24.0, 24.0)
var Yvel = rng.randf_range(-24.0, 24.0)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	set_physics_process(true)



func _physics_process(delta):
	var collidedobject = move_and_collide(Vector2(Xvel, Yvel))
	rotation_degrees += 15

	if (collidedobject):
		if "Enemy" in collidedobject.get_collider().name:
			collidedobject.get_collider().queue_free()
		queue_free()

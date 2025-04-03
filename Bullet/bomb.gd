extends CharacterBody2D


var speed = 300
var rng = RandomNumberGenerator.new()
var current_timer = 3
var bullet_source = preload ("res://Bullet/Bomb Bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


func _physics_process(delta):
	var collidedobject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedobject):
		if "Enemy" in collidedobject.get_collider().name:
			for n in 12: 
				var bullet_instance = bullet_source.instantiate()
				bullet_instance.position = Vector2(position.x, position.y)
				get_tree().get_root().add_child(bullet_instance)
		queue_free()

extends CharacterBody2D

var movement_speed = 300
var bullet_source = preload ("res://Bullet/Bullet.tscn")
@export var health: int = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left") and position.x > 40:	
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right") and position.x < 1240 :	
		move_and_collide(Vector2(movement_speed * delta, 0))

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 3:
			var bullet_instance = bullet_source.instantiate()
			bullet_instance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bullet_instance)


func change_health(health_modifier):
	health = health + health_modifier
	if health > 100:
		health = 100
	elif health < 0:
		get_tree().change_scene_to_file("res://Lose-Scene.tscn")

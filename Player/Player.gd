extends CharacterBody2D

var movement_speed = 300
var bullet_source = preload ("res://Bullet/Bullet.tscn")
var bomb_source = preload ("res://Bullet/Bomb.tscn")
var bombCount = 0
var rng = RandomNumberGenerator.new()
@export var health: int = 100
@export var labelOBJ : Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	global_position = Vector2(GlobalVariables.playerPosition, 660)
	
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
		


	if Input.is_action_just_pressed("bomb"):
		if bombCount >= 1:
			bombCount -= 1
			var bomb_instance = bomb_source.instantiate()
			bomb_instance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bomb_instance)
			
			


func change_health(health_modifier):
	health = health + health_modifier
	if health > 10:
		health = 10
	elif health < 0:
		get_tree().change_scene_to_file("res://Lose-Scene.tscn")


func Powerup(powerup):
	#Bomb Powerup
	if powerup == 1:
		labelOBJ.powerUpLabel("3 Bomb Shots")
		bombCount = 3
	#Firefly Shots
	if powerup == 2:
		labelOBJ.powerUpLabel("Fire Fly Shots!")
		GlobalVariables.fireflyShot = true
		await get_tree().create_timer(5).timeout
		GlobalVariables.fireflyShot = false
	#Extra Points
	if powerup == 3:
		labelOBJ.powerUpLabel("Extra Points")
		GlobalVariables.scoringInformation["currentScore"] += 100

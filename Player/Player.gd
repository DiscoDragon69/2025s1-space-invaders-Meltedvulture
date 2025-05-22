extends CharacterBody2D

var movement_speed = GlobalVariables.playerSpeed
var bullet_source = preload ("res://Bullet/Bullet.tscn")
var bomb_source = preload ("res://Bullet/Bomb.tscn")
var bombCount = 3
var rng = RandomNumberGenerator.new()
var canDash = true
@onready var timer = %"Powerup Timer"
@onready var timer2 = %"Global Timer"
@onready var rapidFireTimer = %"Rapid Fire Timer"
@export var animationPlayer : AnimationPlayer
@export var health: int = 100
@export var labelOBJ : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	set_process(true)
	set_physics_process(true)
	health = GlobalVariables.playerHealth
	GlobalVariables.player = self
	GlobalVariables.fireflyShot = false
	
func _physics_process(delta):
	movement_speed = GlobalVariables.playerSpeed
	if Input.is_action_pressed("ui_left") and position.x > 40:	
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right") and position.x < 1240 :	
		move_and_collide(Vector2(movement_speed * delta, 0))

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.rapidFire == true:
			rapidFire()
		else:
			shoot()
		
	if Input.is_action_just_pressed("bomb"):
		if bombCount >= 1:
			bombCount -= 1
			var bomb_instance = bomb_source.instantiate()
			bomb_instance.position = Vector2(position.x, position.y-35)
			get_tree().get_root().add_child(bomb_instance)
		
	if Input.is_action_just_pressed("dash") and GlobalVariables.dash == true and canDash == true:
		canDash = false
		GlobalVariables.playerSpeed *= 3
		timer.start(0.25)
		await timer.timeout
		GlobalVariables.playerSpeed /= 3
		dashCooldown()

func shoot():
	if GlobalVariables.bulletInstanceCount < GlobalVariables.maxBullets:
		if GlobalVariables.tripleShot == true:
			tripleShot(0)
			if GlobalVariables.bulletInstanceCount < GlobalVariables.maxBullets:
				tripleShot(-1)
			if GlobalVariables.bulletInstanceCount < GlobalVariables.maxBullets:
				tripleShot(1)
		else:
			var bullet_instance = bullet_source.instantiate()
			bullet_instance.position = Vector2(position.x, position.y-35)
			get_tree().get_root().add_child(bullet_instance)



func change_health(health_modifier):
	health = health + health_modifier
	GlobalVariables.playerHealth = health
	if health_modifier < 0:
		for n in 6:
			modulate = Color(255, 0, 0, 255)
			timer.start(0.05)
			await timer.timeout
			modulate = Color(255, 255, 255, 255)
			timer.start(0.05)
			await timer.timeout
	else:
		for n in 8:
			modulate = Color(0, 255, 0, 255)
			timer.start(0.05)
			await timer.timeout
			modulate = Color(255, 255, 255, 255)
			timer.start(0.05)
			await timer.timeout

	if health > 10:
		health = 10
		
	elif health <= 0:
		animationPlayer.play("Player Death", -1, 1)
		await animationPlayer.animation_finished
		GlobalVariables.changeScenes()
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
		timer.start(5)
		await timer.timeout
		GlobalVariables.fireflyShot = false
	#Extra Points
	if powerup == 3:
		labelOBJ.powerUpLabel("Extra Points")
		GlobalVariables.scoringInformation["currentScore"] += 100

func tripleShot(Direction):
	#Direction can only be -1, 0, 1 to indicate which bullet it is
	var bullet_instance = bullet_source.instantiate()
	bullet_instance.position = Vector2(position.x + (15 * Direction) , position.y-35)
	bullet_instance.tripleShotMovement(Direction)
	get_tree().get_root().add_child(bullet_instance)
	
func rapidFire():
	shoot()
	rapidFireTimer.start(GlobalVariables.rapidFireCooldown)
	await rapidFireTimer.timeout
	if Input.is_action_pressed("fire"):
		rapidFire()

func dashCooldown():
	timer2.start(GlobalVariables.dashCooldown)
	await timer2.timeout
	canDash = true
	for n in 4:
			modulate = Color(255, 255, 0, 255)
			timer2.start(0.05)
			await timer.timeout
			modulate = Color(255, 255, 255, 255)
			timer2.start(0.05)
			await timer.timeout

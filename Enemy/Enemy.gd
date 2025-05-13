extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var hasShield = false
var can_shoot = false
var shield = preload("res://Enemy/Shield.tscn")
var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")
var enemyList = ["res://Images/Enemy 1.png",
				"res://Images/Enemy 2.png",
				"res://Images/Enemy 3.png"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", Callable(self, "_colliding"))
	$Timer.wait_time = rng.randf_range(5.0, 10.0)
	#$Timer.wait_time = 0.5
	$Timer.start()
	var chosenEnemy = enemyList[rng.randi_range(0, 2)]
	%Sprite2D.texture = load(chosenEnemy)
	
	if chosenEnemy == enemyList[1]:
		scale = Vector2(1.25, 1.25)
		var shieldInstance = shield.instantiate()
		add_child(shieldInstance)
		hasShield = true
	if chosenEnemy == enemyList[2]:
		scale = Vector2(0.75, 0.75)

	if hasShield == false:
		if GlobalVariables.hardMode == true:
			if rng.randi_range(1, 2) == 2:
				var shieldInstance = shield.instantiate()
				add_child(shieldInstance)
				hasShield = true
		else:
			if rng.randi_range(1, 8) == 4:
				var shieldInstance = shield.instantiate()
				add_child(shieldInstance)
				hasShield = true

func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		GlobalVariables.enemySpeed = -10 
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		GlobalVariables.enemySpeed = 10
		
	if area.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Lose-Scene.tscn")


func fire_bullet() -> void:
	if (can_shoot):
		if GlobalVariables.enemyBulletInstanceCount < 100:
			var bulletInstance = bullet.instantiate()
			bulletInstance.position = Vector2(global_position.x, global_position.y+30)
			get_tree().get_root().add_child(bulletInstance)

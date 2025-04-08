extends CharacterBody2D

var can_shoot = false
var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", Callable(self, "_colliding"))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	$Timer.wait_time = rng.randf_range(2.0, 30.0)
	$Timer.start()

func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -100
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = 100
	if area.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Lose-Scene.tscn")
func fire_bullet() -> void:
	if (can_shoot):
		if GlobalVariables.enemyBulletInstanceCount < 5:
			var bulletInstance = bullet.instantiate()
			bulletInstance.position = Vector2(global_position.x, global_position.y+20)
			get_tree().get_root().add_child(bulletInstance)

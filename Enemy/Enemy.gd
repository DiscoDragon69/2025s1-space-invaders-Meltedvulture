extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", Callable(self, "_colliding"))


func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -100
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = 100

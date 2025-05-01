extends RayCast2D

# Called when the node enters the scene tree for the first time.

var direction1 = false
var direction2 = false

func _ready():
	set_process(true)

func _process(delta):
	target_position = Vector2(75, 150)
	if self.is_colliding():
		direction1 = true
	else:
		direction1 = false
	
	target_position = Vector2(-75, 150)
	if self.is_colliding():
		direction2 = true
	else:
		direction2 = false

	if direction1 == false and direction2 == false:
		get_parent().can_shoot = true
	else:
		get_parent().can_shoot = false

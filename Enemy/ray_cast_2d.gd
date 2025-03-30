extends RayCast2D

# Called when the node enters the scene tree for the first time.

func _ready():
	set_process(true)

func _process(delta):
	if self.is_colliding():
		get_parent().can_shoot = false
	else:
		get_parent().can_shoot = true

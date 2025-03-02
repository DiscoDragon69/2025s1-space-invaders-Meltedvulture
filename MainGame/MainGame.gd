extends Control


@export var countdown_max: int = 10
var current_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	current_timer = countdown_max
	$HUD/Countdown.text = str(current_timer)
	
	while current_timer > 0:
		await get_tree().create_timer(1).timeout
		$HUD/Countdown.text = str(current_timer)
		current_timer -= 1
		print(current_timer)
	print("Game Over")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

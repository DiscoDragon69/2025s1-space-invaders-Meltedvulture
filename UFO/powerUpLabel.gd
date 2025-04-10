extends Node2D
@onready var label = $Label
@onready var animation_player = $AnimationPlayer
var Playing = false

func _ready():
	pass

func powerUpLabel(labelText):
	if Playing == false:
		label.text = labelText
		Playing = true
		animation_player.play("Fade", -1)
		await get_tree().create_timer(3).timeout
		animation_player.play("Fade", -1, -1, true)
		Playing = false

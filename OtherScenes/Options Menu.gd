extends Control

@onready var powerUpToggle = $"Modifiers Title/Powerup"
@onready var hardModeToggle = $"Modifiers Title/Hard Mode"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	powerUpToggle.button_pressed = GlobalVariables.powerUpMode
	hardModeToggle.button_pressed = GlobalVariables.hardMode


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_powerup_toggled(toggled_on: bool) -> void:
	GlobalVariables.powerUpMode = powerUpToggle.button_pressed


func _on_hard_mode_toggled(toggled_on: bool) -> void:
	GlobalVariables.hardMode = hardModeToggle.button_pressed

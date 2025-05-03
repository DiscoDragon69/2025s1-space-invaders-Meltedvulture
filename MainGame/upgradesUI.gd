extends Node2D

@export var animationPlayer : AnimationPlayer
@onready var collision1 = $"Upgrade Ship 1/CollisionShape2D"
@onready var collision2 = $"Upgrade Ship 2/CollisionShape2D"
@onready var upgradeShip1 = $"Upgrade Ship 1"
@onready var upgradeShip2 = $"Upgrade Ship 2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalVariables.UpgradesUI = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func startUpgrades():
	collision1.disabled = true
	collision2.disabled = true
	upgradeShip1.rollUpgrade()
	upgradeShip2.rollUpgrade()
	animationPlayer.play("Upgrade Fly in", -1, 1)
	await animationPlayer.animation_finished
	animationPlayer.play("Upgrade Idle", -1, 1)
	collision1.disabled = false
	collision2.disabled = false

func endUpgrades():
	collision1.disabled = true
	collision2.disabled = true
	animationPlayer.play("Upgrade Fly Out", -1, 1)
	await animationPlayer.animation_finished
	GlobalVariables.mainGame.upgradeFinishedRound()
	collision1.disabled = false
	collision2.disabled = false

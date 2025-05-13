extends Node2D

@export var animationPlayer : AnimationPlayer
#@onready var collision1 = $"Upgrade Ship 1/CollisionShape2D"
#@onready var collision2 = $"Upgrade Ship 2/CollisionShape2D"
#@onready var collision3 = $"Upgrade Ship 3/CollisionShape2D"
#@onready var upgradeShip1 = $"Upgrade Ship 1"
#@onready var upgradeShip2 = $"Upgrade Ship 2"
#@onready var upgradeShip3 = $"Upgrade Ship 3"

@onready var upgradeShip = [
	[$"Upgrade Ship 1", $"Upgrade Ship 1/CollisionShape2D"],
	[$"Upgrade Ship 2", $"Upgrade Ship 2/CollisionShape2D"],
	[$"Upgrade Ship 3", $"Upgrade Ship 3/CollisionShape2D"],
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalVariables.UpgradesUI = self



func startUpgrades():
	upgradeShip[0][1].disabled = true
	upgradeShip[1][1].disabled = true
	upgradeShip[2][1].disabled = true   
	upgradeShip[0][0].rollUpgrade()
	upgradeShip[1][0].rollUpgrade()
	upgradeShip[2][0].rollUpgrade()
	GlobalVariables.upgradeMenu = true
	animationPlayer.play("Upgrade Fly in", -1, 1)
	await animationPlayer.animation_finished
	animationPlayer.play("Upgrade Idle", -1, 1)
	upgradeShip[0][1].disabled = false
	upgradeShip[1][1].disabled = false
	upgradeShip[2][1].disabled = false  

func endUpgrades():
	upgradeShip[0][1].disabled = true
	upgradeShip[1][1].disabled = true
	upgradeShip[2][1].disabled = true  
	GlobalVariables.upgradeMenu = false
	animationPlayer.play("Upgrade Fly Out", -1, 1)
	await animationPlayer.animation_finished
	GlobalVariables.mainGame.upgradeFinishedRound()
	upgradeShip[0][1].disabled = false
	upgradeShip[1][1].disabled = false
	upgradeShip[2][1].disabled = false  

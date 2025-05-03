extends Control

@onready var animationPlayer = $AnimationPlayer
@onready var Player = $Player
@onready var LevelLabel = %LevelLabel
@onready var timer = %"Global Timer"
var rng = RandomNumberGenerator.new()
var enemyScene = preload("res://Enemy/Enemies.tscn")
var levelsPassed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	LevelLabel.text = str("Level: ", GlobalVariables.Level)
	GlobalVariables.mainGame = self
	rollSceneModifiers(rng.randi_range(1, 1))
	
func _process(delta):
	%Health.update_health($Player.health)
	$HUD/CurrentScore.text = str("Current Score: ", GlobalVariables.scoringInformation["currentScore"])

func rollSceneModifiers(pickedScene):
	pass
	#Enemy Speed Increase
	#if pickedScene == 1:
		#return 200

func newRound():
	if GlobalVariables.enemyReference.get_child_count() == 2:
		GlobalVariables.enemyReference.queue_free()
		animationPlayer.play("Win Label Flash", -1, 1)
		await animationPlayer.animation_finished
		#if rng.randi_range(levelsPassed, 5) == 5:
		if true:
			levelsPassed = 0
			GlobalVariables.UpgradesUI.startUpgrades()
		else:
			timer.start(1)
			GlobalVariables.Level += 1
			levelsPassed += 1
			LevelLabel.text = str("Level: ", GlobalVariables.Level)
			var enemy_instance = enemyScene.instantiate()
			enemy_instance.position = Vector2(725, 0)
			get_tree().get_root().add_child(enemy_instance)

func upgradeFinishedRound():
		timer.start(1)
		GlobalVariables.Level += 1
		levelsPassed += 1
		LevelLabel.text = str("Level: ", GlobalVariables.Level)
		var enemy_instance = enemyScene.instantiate()
		enemy_instance.position = Vector2(725, 0)
		get_tree().get_root().add_child(enemy_instance)

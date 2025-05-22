extends Control

@onready var animationPlayer = $AnimationPlayer
@onready var Player = $Player
@onready var LevelLabel = %LevelLabel
@onready var timer = %"Global Timer"
var rng = RandomNumberGenerator.new()
var enemyScene = [
	"res://Enemy/Enemy Formations/Default Enemies.tscn",
	"res://Enemy/Enemy Formations/Circle Enemies.tscn",
]

var levelsPassed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	LevelLabel.text = str("Level: ", GlobalVariables.Level)
	GlobalVariables.mainGame = self
	if GlobalVariables.hardMode == true:
		GlobalVariables.player.change_health(-2)
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
		GlobalVariables.bulletInstanceCount = 0
		await animationPlayer.animation_finished
		if rng.randi_range(levelsPassed, 2) == 2 and GlobalVariables.powerUpMode == true:
			levelsPassed = 0
			GlobalVariables.UpgradesUI.startUpgrades()
		else:
			spawnEnemies()

func upgradeFinishedRound():
	spawnEnemies()


func spawnEnemies():
	var pickedEnemy = enemyScene[rng.randi_range(0, enemyScene.size() - 1)]
	var enemyLoaded = load(pickedEnemy)
	timer.start(1)
	GlobalVariables.Level += 1
	levelsPassed += 1
	LevelLabel.text = str("Level: ", GlobalVariables.Level)
	var enemy_instance = enemyLoaded.instantiate()
	enemy_instance.position = Vector2(640, 230)
	get_tree().get_root().add_child(enemy_instance)

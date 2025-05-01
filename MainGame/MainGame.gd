extends Control

@onready var animationPlayer = $AnimationPlayer
@onready var Player = $Player
@onready var enemyReference = $Enemies
@onready var LevelLabel = %LevelLabel
var rng = RandomNumberGenerator.new()
var enemyScene = preload("res://Enemy/Enemies.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelLabel.text = str("Level: ", GlobalVariables.Level)
	GlobalVariables.mainGame = self
	rollSceneModifiers(rng.randi_range(1, 1))
	
func _process(delta):
	%Health.update_health($Player.health)
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])

func rollSceneModifiers(pickedScene):
	pass
	#Enemy Speed Increase
	#if pickedScene == 1:
		#return 200

func newRound():
	if enemyReference.get_child_count() == 1:
		animationPlayer.play("Win Label Flash", -1, 1)
		await animationPlayer.animation_finished
		await get_tree().create_timer(1).timeout
		GlobalVariables.Level += 1
		LevelLabel.text = str("Level: ", GlobalVariables.Level)
		var enemy_instance = enemyScene.instantiate()
		enemy_instance.position = Vector2(725, 0)
		get_tree().get_root().add_child(enemy_instance)

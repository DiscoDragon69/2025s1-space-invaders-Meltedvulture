extends Node

var bulletInstanceCount = 0
var enemyBulletInstanceCount = 0
var save_file = "user://save.txt"
var fireflyShot : bool = false
var playerHealth = 5
var enemySpeed = -10
var Level = 1
var enemyReference
var mainGame
#My Enemy Count System Variable:
#var enemyCount = 32
var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "User",
	"highScore": 0,
	"highScorePlayerName" : "Winner"
}




#UFO will fly across the screen
#If UFO shot it will choose a random number from 0 to list length of power ups
#Disappear then award powerup
#Times it will fly acoss the screen is random and all that is needed is a modified enemy

#Scene modifiers:
#Upon entering scene random modifier will be added to the scene
#Faster enemies, enemies shoot faster, faster player, more player bullets
#Bullet rain where enemies shoot crazy fast while a player shield moves along the screen that protects the player
#

extends StaticBody2D

@onready var title = $"Upgrade Title"
@onready var description = $"Upgrade Description"
var upgrade = 2

var rng = RandomNumberGenerator.new()
var upgradeText = [
	["Repair Ship", "Heals 1 health"],
	["+1 Bullets", "Allows +1 bullets on screen"],
	["Faster Bullets", "Your bullets will move faster"],
	["Faster Thrusters", "Increase your ships speed"],
	["triple Shot", "Shoot 3 bullets"],
	
	]


func rollUpgrade():
	upgrade = rng.randi_range(0, (upgradeText.size() - 1))
	title.text = upgradeText[upgrade][0]
	description.text = upgradeText[upgrade][1]


func activateUpgrade():
	get_parent().endUpgrades()
	if upgrade == 0:
		GlobalVariables.player.change_health(1)
	if upgrade == 1:
		GlobalVariables.maxBullets += 1
	if upgrade == 2:
		GlobalVariables.bulletSpeed += 100
	if upgrade == 3:
		GlobalVariables.playerSpeed += 100
	if upgrade == 4:
		GlobalVariables.tripleShot = true

#upgrades

#+1 health
#More Player Speed
#More bullets on screen
#Faster Bullets
#Dual Shot
#Dash Upgrade

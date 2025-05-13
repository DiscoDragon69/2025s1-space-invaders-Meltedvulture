extends StaticBody2D

@onready var title = $"Upgrade Title"
@onready var description = $"Upgrade Description"
var upgrade = 0
var dashAdded = false
var FireSpeedAdded = false

var rng = RandomNumberGenerator.new()
var upgradeText = [
	["Repair Ship", "Heals 1 health"],
	["+1 Bullets", "Allows +1 bullets on screen"],
	["Faster Bullets", "+1 Bullet Speed"],
	["Faster Thrusters", "+1 Ship Speed"],
	]


func rollUpgrade():
	if GlobalVariables.dash == true and dashAdded == false:
		dashAdded = true
		upgradeText.append(["Dash Cooldown", "Halves dash cooldown"])
		
	if GlobalVariables.rapidFire == true and FireSpeedAdded == false:
		FireSpeedAdded = true
		upgradeText.append(["Faster Blasters", "+1 Rapid Fire Speed"])
		
	upgrade = rng.randi_range(0, (upgradeText.size() - 1))
	title.text = upgradeText[upgrade][0]
	description.text = upgradeText[upgrade][1]


func activateUpgrade():
	get_parent().endUpgrades()
	if upgradeText[upgrade][0] == "Repair Ship":
		GlobalVariables.player.change_health(1)
	if upgradeText[upgrade][0] == "+1 Bullets":
		GlobalVariables.maxBullets += 1
	if upgradeText[upgrade][0] == "Faster Bullets":
		GlobalVariables.bulletSpeed += 100
	if upgradeText[upgrade][0] == "Faster Thrusters":
		GlobalVariables.playerSpeed += 100
	if upgradeText[upgrade][0] == "Dash Cooldown":
		GlobalVariables.dashCooldown /= 2
	if upgradeText[upgrade][0] == "Faster Blasters":
		GlobalVariables.rapidFireCooldown -= 0.5
		clamp(GlobalVariables.rapidFireCooldown, 0.05, 1)

#upgrades

#+1 health
#More Player Speed
#More bullets on screen
#Faster Bullets
#Dual Shot
#Dash Upgrade

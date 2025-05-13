extends StaticBody2D

@onready var title = $"Upgrade Title"
@onready var description = $"Upgrade Description"
@onready var costLabel = $"Upgrade Cost"
var upgrade
var cost
var value
var costIndex

var rng = RandomNumberGenerator.new()
var upgradeText = [
	["New Ship", "Heals 3 health"],
	["+3 Bullets", "Allows +3 bullets on screen"],
	["Rapid Fire", "Rapid Fire shots"],
	["6 Bombs", "6 Bomb shots"],
	["triple Shot", "Shoot 3 bullets"],
	["Dash Upgrade", "Allows for Dashing Sideways"]
	]

var costText = [
	["-200 score", 200],
	["-300 score", 300],
	["-500 score", 500],
	["-1000 score", 1000],
	["-x Bullets", null],
	["-x Speed", null],
	["-x Health", null],
	]




func _ready():
	rng.randomize()
	visible = false

func rollUpgrade():
	if rng.randi_range(0, 15) == 5:
	#if true:
		visible = true
		costIndex = rng.randi_range(0, (costText.size() - 1))
		upgrade = rng.randi_range(0, (upgradeText.size() - 1))
		cost = costText[costIndex][0]
		costTextCalculate()
		title.text = upgradeText[upgrade][0]
		description.text = upgradeText[upgrade][1]


func costCheck():
	if cost == "-x Bullets" and GlobalVariables.maxBullets > value:
		GlobalVariables.maxBullets -= value
		get_parent().endUpgrades()
		return true
		

	if cost == "-x Speed" and GlobalVariables.playerSpeed > (value * 100):
		GlobalVariables.playerSpeed -= value * 100
		get_parent().endUpgrades()
		return true
		

	if cost == "-x Health" and GlobalVariables.playerHealth > value:
		GlobalVariables.player.change_health(int(-value))
		get_parent().endUpgrades()
		return true
		
	 
	if costText[costIndex][1] is int and GlobalVariables.scoringInformation["currentScore"] >= costText[costIndex][1]:
		GlobalVariables.scoringInformation["currentScore"] -= costText[costIndex][1]
		get_parent().endUpgrades()
		return true
		



func activateUpgrade():
	if costCheck():
		if upgrade == 0:
			GlobalVariables.player.change_health(3)
		if upgrade == 1:
			GlobalVariables.maxBullets += 3
		if upgrade == 2:
			GlobalVariables.rapidFire = true
		if upgrade == 3:
			GlobalVariables.player.bombCount += 6
		if upgrade == 4:
			GlobalVariables.tripleShot = true
		if upgrade == 5:
			GlobalVariables.dash = true
	


func costTextCalculate():
	var costTextToAdd

	if cost == "-x Bullets":
		value = rng.randi_range(1, 3)
		costTextToAdd = "-x Bullets".replace("x", str(value))

	elif cost == "-x Speed":
		value = rng.randi_range(1, 3)
		costTextToAdd = "-x Speed".replace("x", str(value * 100))

	elif cost == "-x Health":
		value = rng.randi_range(1, 3)
		costTextToAdd = "-x Health".replace("x", str(value))
		
	else:
		costTextToAdd = costText[costIndex][0]

	costLabel.text = "Cost: " + costTextToAdd
#upgrades

#+1 health
#More Player Speed
#More bullets on screen
#Faster Bullets
#Dual Shot
#Dash Upgrade

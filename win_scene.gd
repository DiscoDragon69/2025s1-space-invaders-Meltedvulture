extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.scoringInformation["currentScore"] > GlobalVariables.scoringInformation["highScore"]:
		GlobalVariables.scoringInformation["highScore"] = GlobalVariables.scoringInformation["currentScore"]
	
	save_data()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save_data():
	var file = ConfigFile.new()
	file.set_value("Player", "highScore", GlobalVariables.scoringInformation["highScore"])
	var error := file.save (GlobalVariables.save_file)
	
	if error:
		print("!!Data Not Saved!!")

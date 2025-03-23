extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func load_data():
	var config_file := ConfigFile.new()
	var error := config_file.load(GlobalVariables.save_file)
	if error:
		print("An error happened while loading data: ", error)
		return
	
	# Load specific data
	GlobalVariables.scoringInformation["highScore"] = config_file.get_value("Player", "highScore", 0)
	print(GlobalVariables.scoringInformation["highScore"])

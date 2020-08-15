extends Node2D



var currentLevel : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect("ending", self, "on_Ending")


func on_Ending():
	$Level.queue_free()
	get_node("/root/MainScene").remove_child($Level)
	currentLevel += 1
	var next_level_path = "res://Levels/Level" + str(currentLevel) + "/Scenes/Level/Level" + str(currentLevel) + ".tscn"
	var next_level = load(next_level_path).instance()
	get_node("/root/MainScene").add_child(next_level)
	next_level.set_name("Level")
	get_node("/root/MainScene").move_child(next_level,1)
	$Player.toStart = true

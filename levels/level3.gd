extends Node


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Ready.isReady1 and Ready.isReady2):
		get_tree().change_scene_to_file("res://MainMenu.tscn")
		Ready.isReady1=false
		Ready.isReady2=false

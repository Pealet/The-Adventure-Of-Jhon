extends Button

func _pressed():
	print("Nappia painettu!")
	get_tree().change_scene_to_file("res://Da Game/Testmap.tscn")

extends Button
func _on_start_button_pressed():
	print("Nappia painettu!")  # Tarkista konsolista
	get_tree().change_scene_to_file("res://Da Game/Testmap.tscn")

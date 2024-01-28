extends Control






func _on_quit_button_pressed():
	get_tree().quit()


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")


func _on_level_2_pressed():#second level
	pass # Replace with function body.


func _on_level_3_pressed():#third level
	pass # Replace with function body.

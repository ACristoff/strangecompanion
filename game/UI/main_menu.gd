extends Control

func _on_StartButton_pressed() -> void:
	get_tree().change_scene_to_file("res://game/manager.tscn")

func _on_InstructionsButton_pressed() -> void:
	# Logic for showing instructions
	pass

func _on_QuitButton_pressed() -> void:
	get_tree().quit()

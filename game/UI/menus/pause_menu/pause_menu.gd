extends Control
var paused = false
@onready var pause_menu = $"."

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		PauseGame()
		print("pause")


func PauseGame():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused


func _on_resume_pressed() -> void:
	PauseGame()


func _on_quit_pressed() -> void:
	get_tree().quit()

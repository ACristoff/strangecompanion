extends Control

func _ready():
	preload("res://game/game.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_button_down() -> void:
	$CanvasLayer/Buttons.frame = 0


func _on_quit_button_down() -> void:
	$CanvasLayer/Buttons2.frame = 0


func _on_quit_button_up() -> void:
	$CanvasLayer/Buttons2.frame = 1


func _on_play_button_up() -> void:
	$CanvasLayer/Buttons.frame = 1

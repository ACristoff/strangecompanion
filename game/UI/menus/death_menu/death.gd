extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("death1")
	$Label.visible = false
	$Buttons2.visible = false
	$Buttons3.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death1":
		$Label.visible = true
		$Buttons2.visible = true
		$Buttons3.visible = true


func _on_quit_pressed() -> void:
	JuicyDetails.set_script(null)
	JuicyDetails.set_script(preload("res://game/JuicyDetails.gd"))
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_quitbutbetter_pressed() -> void:
	get_tree().quit()

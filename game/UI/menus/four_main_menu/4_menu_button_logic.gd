extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_wardrobe_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($WardrobeIcon, "rotation_degrees", 1, .05)
	tween.tween_property($WardrobeIcon, "rotation_degrees", -1, .1)
	tween.tween_property($WardrobeIcon, "rotation_degrees", 0, .05)


func _on_start_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($StartIcon, "rotation_degrees", 1, .05)
	tween.tween_property($StartIcon, "rotation_degrees", -1, .1)
	tween.tween_property($StartIcon, "rotation_degrees", 0, .05)


func _on_challenges_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($ChallengesIcon, "rotation_degrees", 1, .05)
	tween.tween_property($ChallengesIcon, "rotation_degrees", -1, .1)
	tween.tween_property($ChallengesIcon, "rotation_degrees", 0, .05)


func _on_settings_button_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property($SettingsIcon, "rotation_degrees", 1, .05)
	tween.tween_property($SettingsIcon, "rotation_degrees", -1, .1)
	tween.tween_property($SettingsIcon, "rotation_degrees", 0, .05)

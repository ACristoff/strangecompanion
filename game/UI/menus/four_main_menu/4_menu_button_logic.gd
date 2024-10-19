extends Control


@onready var start = $MarginContainer/HBoxContainer/MarginContainer
@onready var wardrobe = $MarginContainer/HBoxContainer/VBoxContainer/MarginContainer
@onready var challenges = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/MarginContainer
@onready var settings = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/MarginContainer2

@onready var wardrobescene = preload("res://game/UI/menus/wardrobe_ui.tscn")
@onready var challengesscene = preload("res://game/UI/menus/challenges_ui.tscn")
@onready var settingsscene = preload("res://game/UI/menus/settings_ui.tscn")

var down = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pivot_offset = start.size/2
	wardrobe.pivot_offset = wardrobe.size/2
	challenges.pivot_offset = challenges.size/2
	settings.pivot_offset = settings.size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#start.pivot_offset = start.size/2
	#wardrobe.pivot_offset = wardrobe.size/2
	#challenges.pivot_offset = challenges.size/2
	#settings.pivot_offset = settings.size/2
func _on_wardrobe_button_mouse_entered() -> void:
	start.pivot_offset = start.size/1.2
	button_nervous(wardrobe)
func _on_start_button_mouse_entered() -> void:
	wardrobe.pivot_offset = wardrobe.size/1.2
	button_nervous(start)
func _on_challenges_button_mouse_entered() -> void:
	challenges.pivot_offset = wardrobe.size/1.2
	button_nervous(challenges)
func _on_settings_button_mouse_entered() -> void:
	settings.pivot_offset = wardrobe.size/1.2
	button_nervous(settings)
	
func _on_start_button_pressed() -> void:
	pass
func _on_wardrobe_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/UI/menus/wardrobe_ui.tscn")
func _on_challenges_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/UI/menus/challenges_ui.tscn")
func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/UI/menus/settings_ui.tscn")
	
	
	
func button_shrink(button, state):
	var tween = create_tween()
	#tween.set_trans(Tween.TRANS_ELASTIC)
	if down == 1:
		tween.tween_property(button, "scale", Vector2(.95, .95), .05)
	else:
		tween.tween_property(button, "scale", Vector2(1, 1), .05)
	
func button_nervous(button):
	var tween = create_tween()
	tween.tween_property(button, "rotation_degrees", 1, .05)
	tween.tween_property(button, "rotation_degrees", -1, .1)
	tween.tween_property(button, "rotation_degrees", 0, .05)
	


func _on_start_button_button_down() -> void:
	down = 1
	start.pivot_offset = start.size/2
	button_shrink(start, down)
func _on_start_button_button_up() -> void:
	down = 0
	start.pivot_offset = start.size/2
	button_shrink(start, down)
func _on_wardrobe_button_button_down() -> void:
	down = 1
	wardrobe.pivot_offset = wardrobe.size/2
	button_shrink(wardrobe, down)
func _on_wardrobe_button_button_up() -> void:
	down = 0
	wardrobe.pivot_offset = wardrobe.size/2
	button_shrink(wardrobe, down)
func _on_challenges_button_button_down() -> void:
	down = 1
	challenges.pivot_offset = challenges.size/2
	button_shrink(challenges, down)
func _on_challenges_button_button_up() -> void:
	down = 0
	challenges.pivot_offset = challenges.size/2
	button_shrink(challenges, down)
func _on_settings_button_button_down() -> void:
	down = 1
	settings.pivot_offset = settings.size/2
	button_shrink(settings, down)
func _on_settings_button_button_up() -> void:
	down = 0
	settings.pivot_offset = settings.size/2
	button_shrink(settings, down)

extends Control

@onready var dress = $MarginContainer3/HBoxContainer/MarginContainer
@onready var stitches = $MarginContainer3/HBoxContainer/MarginContainer2
@onready var mainmenu = preload("res://game/UI/menus/main_ui.tscn")

var down = 1

func _ready() -> void:
	dress.pivot_offset = dress.size/2
	stitches.pivot_offset = stitches.size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	
func _on_outfits_button_mouse_entered() -> void:
	dress.pivot_offset = dress.size/1.2
	button_nervous(dress)
func _on_outfits_button_button_down() -> void:
	down = 1
	dress.pivot_offset = dress.size/2
	button_shrink(dress, down)
func _on_outfits_button_button_up() -> void:
	down = 0
	dress.pivot_offset = dress.size/2
	button_shrink(dress, down)
func _on_outfits_button_pressed() -> void:
	pass
	
func _on_stitches_button_mouse_entered() -> void:
	stitches.pivot_offset = stitches.size/1.2
	button_nervous(stitches)
func _on_stitches_button_button_down() -> void:
	down = 1
	stitches.pivot_offset = stitches.size/2
	button_shrink(stitches, down)
func _on_stitches_button_button_up() -> void:
	down = 0
	stitches.pivot_offset = stitches.size/2
	button_shrink(stitches, down)
func _on_stitches_button_pressed() -> void:
	pass # Replace with function body.

func button_nervous(button):
	var tween = create_tween()
	tween.tween_property(button, "rotation_degrees", 1, .05)
	tween.tween_property(button, "rotation_degrees", -1, .1)
	tween.tween_property(button, "rotation_degrees", 0, .05)

func button_shrink(button, state):
	var tween = create_tween()
	#tween.set_trans(Tween.TRANS_ELASTIC)
	if down == 1:
		tween.tween_property(button, "scale", Vector2(.95, .95), .05)
	else:
		tween.tween_property(button, "scale", Vector2(1, 1), .05)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/UI/menus/main_ui.tscn")

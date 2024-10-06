extends Control

var round = 1

func _process(delta: float) -> void:
	$CanvasLayer/Label.text = "Round " + str(round) + " Completed"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($CanvasLayer/Node2D, "global_position", $lodestart.global_position, 0)
	tween.tween_property($CanvasLayer/Node2D2, "global_position", $roidstart.global_position, 0)
	tween.tween_property($CanvasLayer/Node2D3, "global_position", $cornstart.global_position, 0)
	_shopbegin()


# Called every frame. 'delta' is the elapsed time since the previous frame

func _shopbegin():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($CanvasLayer/Node2D, "global_position", $lodeend.global_position, .5)
	tween.tween_property($CanvasLayer/Node2D2, "global_position", $roidend.global_position, .5)
	tween.tween_property($CanvasLayer/Node2D3, "global_position", $cornend.global_position, .5)
	pass


func _on_lodetreat_pressed() -> void:
	pass # Replace with function body.


func _on_roidshroom_pressed() -> void:
	pass # Replace with function body.


func _on_strugglingcorn_pressed() -> void:
	pass # Replace with function body.

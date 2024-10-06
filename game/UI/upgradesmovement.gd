extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _shopbegin():
	var tween = create_tween()
	tween.tween_property($CanvasLayer/Node2D, "global_position", $lodestart.global_position, 0)
	pass

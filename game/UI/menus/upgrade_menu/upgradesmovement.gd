extends Control

#var round = JuicyDetails.score
var available = true

func _process(delta: float) -> void:
	$CanvasLayer/Label.text = "Round " + str(round) + " Completed"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("player shotpseed --> " + str(JuicyDetails.player_shotspeed))
	#print("player damage --> " + str(JuicyDetails.player_damage))
	#print("player speed --> " + str(JuicyDetails.player_speed))
	var tween = create_tween()
	tween.tween_property($CanvasLayer/Node2D, "global_position", $CanvasLayer/lodestart.global_position, 0)
	tween.tween_property($CanvasLayer/Node2D2, "global_position", $CanvasLayer/roidstart.global_position, 0)
	tween.tween_property($CanvasLayer/Node2D3, "global_position", $CanvasLayer/cornstart.global_position, 0)
	_shopbegin()


# Called every frame. 'delta' is the elapsed time since the previous frame

func _shopbegin():
	get_tree().paused = true
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property($CanvasLayer/Node2D, "global_position", $CanvasLayer/lodeend.global_position, .5)
	tween.tween_property($CanvasLayer/Node2D2, "global_position", $CanvasLayer/roidend.global_position, .5)
	tween.tween_property($CanvasLayer/Node2D3, "global_position", $CanvasLayer/cornend.global_position, .5)
	pass


func _on_lodetreat_pressed() -> void:
	available = false
	#JuicyDetails.player_shotspeed = -JuicyDetails.player_shotspeed * .20 + JuicyDetails.player_shotspeed
	_purchased()
	#print("player shotpseed --> " + str(JuicyDetails.player_shotspeed))
	pass # Replace with function body.
	


func _on_roidshroom_pressed() -> void:
	#JuicyDetails.player_damage = JuicyDetails.player_damage * .20 + JuicyDetails.player_damage
	available = false
	#print("player damage --> " + str(JuicyDetails.player_damage))
	_purchased()


func _on_strugglingcorn_pressed() -> void:
	#JuicyDetails.player_speed = JuicyDetails.player_speed * .10 + JuicyDetails.player_speed
	available = false
	#print("player speed --> " + str(JuicyDetails.player_speed))
	_purchased()

func _purchased():
	$CanvasLayer/Node2D/lodetreat.disabled = true
	$CanvasLayer/Node2D2/roidshroom.disabled = true
	$CanvasLayer/Node2D3/strugglingcorn.disabled = true
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property($CanvasLayer/Node2D, "global_position", $CanvasLayer/lodestart.global_position, .3)
	tween.tween_property($CanvasLayer/Node2D2, "global_position", $CanvasLayer/roidstart.global_position, .3)
	tween.tween_property($CanvasLayer/Node2D3, "global_position", $CanvasLayer/cornstart.global_position, .3)
	tween.tween_callback(die)
	
func die():
	get_tree().paused = false
	queue_free()
	
	
	

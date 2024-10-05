extends Sprite2D

var speed = 50
var velocity = Vector2()

func _process(delta):
	if GlobalPos.player != null:
		velocity = global_position.direction_to(GlobalPos.player.global_position)
		global_position += velocity * speed * delta


func _on_hitbox_area_entered(area):
	if area.is_in_group(""): #whatever we call bullets
	
		area.get_parent().queue.free()

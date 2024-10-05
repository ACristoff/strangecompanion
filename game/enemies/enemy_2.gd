extends Sprite2D

var speed = 50
var velocity = Vector2()
var health = 150

func _process(delta):
	if GlobalPos.player != null:
		velocity = global_position.direction_to(GlobalPos.player.global_position)
		global_position += velocity * speed * delta
	if health <= 0:
		queue_free()

func _on_hitbox_area_entered(area):
	if area.is_in_group(""): #whatever we call bullets
		health -= 25
		area.get_parent().queue.free()

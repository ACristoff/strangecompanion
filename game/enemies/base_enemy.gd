extends Area2D
class_name ENEMY

var speed = 100
var velocity = Vector2()
var health = 10

func _process(delta):
	if GlobalPos.player != null:
		velocity = global_position.direction_to(GlobalPos.player.global_position)
		global_position += velocity * speed * delta

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()

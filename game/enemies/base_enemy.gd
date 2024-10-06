extends Area2D
class_name ENEMY

var biggie = preload("res://Assets/Enemy/Small_Pumpkin_SpriteSheet.PNG")
var smalls = preload("res://Assets/Enemy/Small_Pumpkin_SpriteSheet.PNG")

var speed = 100
var velocity = Vector2()
var health = 10
var type = null

var enemy_types =  {
	"biggie": {
		"energy":10,
		"speed": 100,
		"health": 20,
		"scale": Vector2(1,1),
		"sprite": biggie
	},
	"smalls": {
		"energy":5,
		"speed": 200,
		"health": 6,
		"scale": Vector2(0.6,0.6),
		"sprite": smalls
	}
}

func construct_enemy(new_type):
	type = new_type
	health = enemy_types[new_type].health
	speed = enemy_types[new_type].speed
	$Sprite2D.scale = $Sprite2D.scale * enemy_types[new_type].scale
	$CollisionShape2D.scale = $CollisionShape2D.scale * enemy_types[new_type].scale

func _process(delta):
	if GlobalPos.player != null:
		velocity = global_position.direction_to(GlobalPos.player.global_position)
		global_position += velocity * speed * delta

func take_damage(damage):
	health -= damage
	if health <= 0 && type != null:
		JuicyDetails._addenergy(enemy_types[type].energy)
		queue_free()

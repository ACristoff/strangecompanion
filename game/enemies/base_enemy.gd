extends Area2D
class_name ENEMY

var biggie = preload("res://Assets/Enemy/Small_Pumpkin_SpriteSheet.PNG")

var speed = 100
var velocity = Vector2()
var health = 10

var enemy_types =  {
	"biggie": {
		"speed": 100,
		"health": 20,
		"scale": Vector2(1,1),
		"sprite": null
	},
	"smalls": {
		"speed": 200,
		"health": 6,
		"scale": Vector2(0.6,0.6)
	}
}

func construct_enemy(type):
	#print(type)
	health = enemy_types[type].health
	speed = enemy_types[type].speed
	$Sprite2D.scale = $Sprite2D.scale * enemy_types[type].scale
	$CollisionShape2D.scale = $CollisionShape2D.scale * enemy_types[type].scale

func _process(delta):
	if GlobalPos.player != null:
		velocity = global_position.direction_to(GlobalPos.player.global_position)
		global_position += velocity * speed * delta

func take_damage(damage):
	health -= damage
	if health <= 0:
		
		queue_free()

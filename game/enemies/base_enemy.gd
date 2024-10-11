extends Area2D
class_name ENEMY

var middie = preload("res://Assets/Enemy/Pumpkin_Medium_Spritesheet.png")
var biggie = preload("res://Assets/Enemy/Pumpkin_Large_Spritesheet.png")
var small = preload("res://Assets/Enemy/Small_Pumpkin_SpriteSheet.PNG")

var speed = 100
var velocity = Vector2()
var health = 10
var type = null
var target = get_tree().get_first_node_in_group("player")

var enemy_types =  {
	"biggie": {
		"energy":10,
		"speed": 100,
		"health": 20,
		"scale": Vector2(.1,.1),
		"sprite": biggie,
		"hframes": 3,
		"vframes":2,
		"collision": Vector2(.6,1),
	},
	"smalls": {
		"energy":5,
		"speed": 200,
		"health": 6,
		"scale": Vector2(0.1,0.1),
		"sprite": small,
		"hframes": 2,
		"vframes":1,
		"collision": Vector2(.5,.5),
	},
	"middie": {
		"energy":7,
		"speed": 150,
		"health":15,
		"scale": Vector2(.1,.1),
		"sprite": middie, 
		"hframes": 3,
		"vframes":2,
		"collision": Vector2(.6,.6),
		
		
		
	}
}

func construct_enemy(new_type):
	
	type = new_type
	health = enemy_types[new_type].health
	speed = enemy_types[new_type].speed
	
	$Sprite2D.scale = $Sprite2D.scale * enemy_types[new_type].scale
	$CollisionShape2D.scale = enemy_types[new_type].collision
	$RigidBody2D/CollisionShape2D.scale = enemy_types[new_type].collision
	$Sprite2D.texture = enemy_types[new_type].sprite
	$Sprite2D.hframes = enemy_types[new_type].hframes
	$Sprite2D.vframes = enemy_types[new_type].vframes
	if new_type == "biggie":
		$AnimationPlayer.play("biggie")
	elif new_type == "small":
		$AnimationPlayer.play("small")
	elif new_type == "middie":
		$AnimationPlayer.play("meddie")
	

func _process(delta):
	if target != null:
		velocity = global_position.direction_to(target.player.global_position)
		global_position += velocity * speed * delta

func take_damage(damage):
	health -= damage
	$Hit1.play()
	#var choice = randi_range(1.4)
	#if choice == 1:
		#$Hit1
	#elif choice ==2:
		#$Hit2
	#elif choice ==2:
		#$Hit3
	#elif choice ==2:
		#$Hit3
	if health <= 0 && type != null:
		$Death.play()
		#JuicyDetails._addenergy(enemy_types[type].energy)
		#queue_free()
#func change_type(type):

func _on_death_finished() -> void:
	queue_free()

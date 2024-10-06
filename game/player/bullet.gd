extends Node2D

@export var speed = 300
var damage = 1
var type = null
var velocity = Vector2()
var target = null

var spread_sprite = preload("res://Assets/Player/(FIXED)SpreadBullet_SpriteSheet.PNG")
var big_sprite = preload("res://Assets/Player/(FIXED)BigBullet_Spritesheet.PNG")
var homing_sprite = preload("res://Assets/Player/(FIXED)HoningBullet_SpriteSheet.PNG")
var normal_sprite = preload("res://Assets/Player/defaultshot.png")

@onready var sprite = $Sprite2D

var bullet_dictionary = {
	"spread": {
		"sprite": spread_sprite
	},
	"big": {
		"sprite": big_sprite
	},
	"homing": {
		"sprite": homing_sprite
	}
}

func change_type(new_type): 
	type = new_type
	sprite.texture = bullet_dictionary[type].sprite
	if new_type == "homing":
		$DetectionField.visible = true
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("crystal")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target == null:
		position += transform.x * speed * delta
	else:
		if GlobalPos.player != null:
			velocity = global_position.direction_to(target.global_position)
			global_position += velocity * speed * delta
			pass
	pass

func particle_hit():
	##Particles triggered here!
	##Use conditionals like the one below to trigger a specific effect!
	#if type == bullet_dictionary.spread:
		#pass
	pass


func _on_area_entered(area):
	if area is ENEMY:
		particle_hit()
		area.take_damage(damage)
		if type != "big":
			queue_free()
	pass # Replace with function body.

func _on_detection_field_area_entered(area):
	if target == null && $DetectionField.visible == true:
		print('bing')
		if area is ENEMY:
			target = area
	pass # Replace with function body.

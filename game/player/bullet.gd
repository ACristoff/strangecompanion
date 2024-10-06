extends Node2D

@export var speed = 300
var damage = 0
var type = null

var spread_sprite = preload("res://Assets/Player/(FIXED)SpreadBullet_SpriteSheet.PNG")
var big_sprite = preload("res://Assets/Player/(FIXED)BigBullet_Spritesheet.PNG")
var homing_sprite = preload("res://Assets/Player/(FIXED)HoningBullet_SpriteSheet.PNG")

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
	#print(new_type)
	if new_type == "homing":
		
		$DetectionField.visible = true
		print($DetectionField.visible)
		pass
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("crystal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
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
		#prints(type)
		if type != "big":
			queue_free()
	pass # Replace with function body.


func _on_detection_field_area_entered(area):
	pass # Replace with function body.

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
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("crystal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	pass


func _on_area_entered(area):
	prints(area, "takes", damage, "damage!")
	#if area is Enemy
		#area.take_damage(damage)
	pass # Replace with function body.

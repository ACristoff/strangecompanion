extends CharacterBody2D

@onready var lode_parent = $CompanionParent
@onready var lode = $CompanionParent/CompanionActor
@onready var sprite = $Sprite2D
@onready var shoot_timer = $ShootTimer
var BULLET = preload("res://game/player/bullet.tscn")

@export var SPEED = 300
@export var health = 100
@export var lode_speed = 1.2

var companion_radius = 100

var SHOOT_MODE = {
	"BIG": {
		"TIMER": 3,
		"DAMAGE": 10
	},
	"SPREAD": {
		"TIMER": 2,
		"DAMAGE": 2
	},
	"HOMING": {
		"TIMER": 0.4,
		"DAMAGE": 4
	}
}

var current_mode = SHOOT_MODE.HOMING

var face_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	shoot_timer.wait_time = current_mode.TIMER
	pass # Replace with function body.

func change_mode(mode):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##LODE CODE##
	lode_parent.rotation_degrees += lode_speed

	##PLAYER MOVEMENT##
	var horizontalDirection = Input.get_axis("ui_left", "ui_right")
	var verticalDirection = Input.get_axis("ui_up", "ui_down")
	if horizontalDirection:
		sprite.flip_h = (horizontalDirection == -1)
		face_right = (horizontalDirection == 1)
		pass
	velocity.x = horizontalDirection * SPEED
	velocity.y = verticalDirection * SPEED
	#This normalizes velocity when moving diagonally
	velocity = velocity.normalized() * min(velocity.length(), SPEED)
	move_and_slide()
	pass

#TODO Shooting from companion node

#TODO On Hit


func on_shoot_timeout():
	print("bang!")
	var lode_pos = lode.position
	var my_pos = self.position
	var angle = lode_pos.angle_to_point(my_pos)
	print(rad_to_deg(angle) , lode_pos, my_pos)
	#var bullet = bullet.instance
	#get_parent().
	var new_bullet = BULLET.instantiate()
	lode.add_child(new_bullet)
	new_bullet.position = lode_pos
	pass # Replace with function body.

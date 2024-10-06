extends CharacterBody2D

@onready var lode_parent = $CompanionParent
@onready var lode = $CompanionParent/CompanionActor
@onready var sprite = $Sprite2D
@onready var shoot_timer = $ShootTimer
@onready var anim_player = $AnimationPlayer
var BULLET = preload("res://game/player/bullet.tscn")

@export var SPEED = 300
@export var health = 100
@export var lode_speed = 1.2

var companion_radius = 100

var SHOOT_MODE = {
	"BIG": {
		"TIMER": 3,
		"DAMAGE": 10,
		"AMOUNT": 1,
		"SPEED": 100,
	},
	"SPREAD": {
		"TIMER": 1.2,
		"DAMAGE": 2,
		"AMOUNT": 3,
		"SPEED": 320,
	},
	"HOMING": {
		"TIMER": 0.4,
		"DAMAGE": 4,
		"AMOUNT": 1,
		"SPEED": 450,
	}
}

var current_mode = SHOOT_MODE.BIG

var face_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	#$CompanionParent/CompanionActor/AnimationPlayer.play("dress")
	shoot_timer.wait_time = current_mode.TIMER
	
	##Global can reference it's own children with $
	##Refer to line 3-6 of this file as an example
	GlobalPos.player = self
	pass # Replace with function body.

func change_mode(mode):
	print(mode)
	current_mode = mode
	shoot_timer.wait_time = current_mode.TIMER
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##LODE CODE##
	lode_parent.rotation_degrees += lode_speed
	
	if Input.is_action_just_pressed("select_1"):
		change_mode(SHOOT_MODE.BIG)
		pass
	if Input.is_action_just_pressed("select_2"):
		change_mode(SHOOT_MODE.SPREAD)
		pass
	if Input.is_action_just_pressed("select_3"):
		change_mode(SHOOT_MODE.HOMING)
		pass
	
	##PLAYER MOVEMENT##
	var horizontalDirection = Input.get_axis("ui_left", "ui_right")
	var verticalDirection = Input.get_axis("ui_up", "ui_down")
	if horizontalDirection:
		sprite.flip_h = (horizontalDirection == -1)
		$outfitcrystal/BlueOutfitWitch.flip_h = (horizontalDirection == -1)
		$outfitcrystal/BlueScarfWitch.flip_h = (horizontalDirection == -1)
		$outfitcrystal/BlueHatWitch.flip_h = (horizontalDirection == -1)
		face_right = (horizontalDirection == 1)
		pass
	velocity.x = horizontalDirection * SPEED
	velocity.y = verticalDirection * SPEED
	#This normalizes velocity when moving diagonally
	velocity = velocity.normalized() * min(velocity.length(), SPEED)
	move_and_slide()
	pass

#TODO On Hit

func fire_bullet():
	var lode_pos = lode.global_position
	var my_pos = self.global_position
	var angle = my_pos.angle_to_point(lode_pos)
	
	if current_mode == SHOOT_MODE.SPREAD: 
		for n in SHOOT_MODE.SPREAD.AMOUNT:
			##TODO Refactor this formula to account for more bullets, 
			##perhaps increase the spread per bullet to a maximum of 90 degrees?
			var spread_angle = -15 + (15 * n)
			var new_bullet = BULLET.instantiate()
			get_parent().add_child(new_bullet)
			new_bullet.rotation_degrees = rad_to_deg(angle) + spread_angle
			new_bullet.global_position = lode.global_position
			new_bullet.speed = current_mode.SPEED
			new_bullet.type = 1
			pass
	elif current_mode == SHOOT_MODE.BIG:
		var new_bullet = BULLET.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.rotation_degrees = rad_to_deg(angle)
		new_bullet.global_position = lode.global_position
		new_bullet.scale = Vector2(3, 3)
		new_bullet.speed = current_mode.SPEED
		new_bullet.type = 2
		pass
	elif current_mode == SHOOT_MODE.HOMING:
		var new_bullet = BULLET.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.rotation_degrees = rad_to_deg(angle)
		new_bullet.global_position = lode.global_position
		new_bullet.speed = current_mode.SPEED
		new_bullet.type = 3
		pass
	pass

func on_shoot_timeout():
	fire_bullet()
	pass # Replace with function body.

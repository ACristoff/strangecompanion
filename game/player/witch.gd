extends CharacterBody2D
class_name PLAYER

@onready var lode_parent = $CompanionParent
@onready var lode = $CompanionParent/CompanionActor
@onready var sprite = $Sprite2D
@onready var lodey_outfit = $CompanionParent/CompanionActor/Sprite2D/LodeyOutfit
@onready var lodey_dress = $CompanionParent/CompanionActor/Sprite2D/LodeyDress
@onready var anim_player = $AnimationPlayer
@onready var shoot_timer = $ShootTimer
@onready var cooldown_timer = $CooldownTimer
@onready var invul_timer = $InvulTimer

var BULLET = preload("res://game/player/bullet.tscn")

var big_shot_lodey_outfit = preload("res://Assets/Player/BigShot_Outfit.PNG")
var homing_shot_lodey_outfit = preload("res://Assets/Player/WO Familiar Six Costume Blank Shortened.png")
var spread_shot_lodey_outfit = preload("res://Assets/Player/cirnooutfit.png")

var spread_shot_outfit = preload("res://Assets/Player/BlueWitch.png")
var big_shot_outfit = preload("res://Assets/Player/RedWitch.png")
var homing_shot_outfit = preload("res://Assets/Player/YellowWitch.png")
var default_shot_outfit = preload("res://Assets/Player/WhiteWitch.png")

var big_shot_idle = preload("res://Assets/Player/RedIdle.png")
var spread_shot_idle = preload("res://Assets/Player/BlueIdle.png")
var homing_idle = preload("res://Assets/Player/YellowIdle.png")
var default_idle = preload("res://Assets/Player/WhiteIdle.png")

#@export var SPEED = JuicyDetails.player_speed
@export var SPEED = 300
@export var health = 100
@export var lode_speed = 1.5
#@export var shot_speed = JuicyDetails.player_shotspeed
#@export var player_damage = JuicyDetails.player_damage

var companion_radius = 100

var SHOOT_MODE = {
	"DEFAULT": {
		"TIMER": 1.4,
		"DAMAGE": 7,
		"AMOUNT": 1,
		"SPEED": 250,
	},
	"BIG": {
		"TIMER":  1,
		"DAMAGE": 1,
		"AMOUNT": 1,
		"SPEED": 100,
	},
	"SPREAD": {
		"TIMER": .8,
		"DAMAGE": 7,
		"AMOUNT": 3,
		"SPEED": 320,
	},
	"HOMING": {
		"TIMER": 1.6,
		"DAMAGE": 8,
		"AMOUNT": 1,
		"SPEED": 450,
	}
}

var current_mode = SHOOT_MODE.DEFAULT

var face_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	lodey_outfit.visible = false
	shoot_timer.wait_time = current_mode.TIMER
	pass # Replace with function body.

func change_mode(mode):
	$Sprite2D.hframes = 8
	if cooldown_timer.time_left > 0:
		return
	current_mode = mode
	lodey_outfit.visible = true
	shoot_timer.wait_time = current_mode.TIMER
	if current_mode == SHOOT_MODE.BIG:
		lodey_outfit.texture = big_shot_lodey_outfit
		if velocity.x == 0 and velocity.y == 0:
			sprite.texture = big_shot_idle
		else:
			sprite.texture = big_shot_outfit
	elif current_mode == SHOOT_MODE.SPREAD:
		if velocity.x == 0 and velocity.y == 0:
			sprite.texture = spread_shot_idle
		else:
			sprite.texture = spread_shot_outfit
		lodey_outfit.texture = spread_shot_lodey_outfit
	elif current_mode == SHOOT_MODE.HOMING:
		lodey_outfit.texture = homing_shot_lodey_outfit
		if velocity.x == 0 and velocity.y == 0:
			sprite.texture = homing_idle
		else:
			sprite.texture = homing_shot_outfit
	else:
		lodey_outfit.visible = false
		if velocity.x == 0 and velocity.y == 0:
			sprite.texture = default_idle
		else:
			sprite.texture = default_shot_outfit
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
		face_right = (horizontalDirection == 1)
		pass
	velocity.x = horizontalDirection * SPEED
	velocity.y = verticalDirection * SPEED
	#This normalizes velocity when moving diagonally
	velocity = velocity.normalized() * min(velocity.length(), SPEED)
	if velocity.x == 0 and velocity.y == 0:
		$Sprite2D.hframes = 2
		#$Sprite2D.vframes = 1
		if $AnimationPlayer.current_animation != "standing":
			if current_mode == SHOOT_MODE.BIG:
				lodey_outfit.texture = big_shot_lodey_outfit
				sprite.texture = big_shot_idle
			elif current_mode == SHOOT_MODE.SPREAD:
				sprite.texture = spread_shot_idle
				lodey_outfit.texture = spread_shot_lodey_outfit
			elif current_mode == SHOOT_MODE.HOMING:
				lodey_outfit.texture = homing_shot_lodey_outfit
				sprite.texture = homing_idle
			else:
				lodey_outfit.visible = false
				sprite.texture = default_idle
			$AnimationPlayer.play("standing")
	else:
		if current_mode == SHOOT_MODE.BIG:
			lodey_outfit.texture = big_shot_lodey_outfit
			sprite.texture = big_shot_outfit
		elif current_mode == SHOOT_MODE.SPREAD:
			sprite.texture = spread_shot_outfit
			lodey_outfit.texture = spread_shot_lodey_outfit
		elif current_mode == SHOOT_MODE.HOMING:
			lodey_outfit.texture = homing_shot_lodey_outfit
			sprite.texture = homing_shot_outfit
		else:
			lodey_outfit.visible = false
			sprite.texture = default_shot_outfit 
		#print("walking")
		$Sprite2D.hframes = 8
		#print($Sprite2D.hframes)
		$AnimationPlayer.play("walk")
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
			new_bullet.damage = current_mode.DAMAGE
			new_bullet.change_type("spread")
			pass
	elif current_mode == SHOOT_MODE.BIG:
		var new_bullet = BULLET.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.rotation_degrees = rad_to_deg(angle)
		new_bullet.global_position = lode.global_position
		new_bullet.scale = Vector2(2, 2)
		new_bullet.speed = current_mode.SPEED
		new_bullet.damage = current_mode.DAMAGE
		new_bullet.change_type("big")
		pass
	elif current_mode == SHOOT_MODE.HOMING:
		var new_bullet = BULLET.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.rotation_degrees = rad_to_deg(angle)
		new_bullet.global_position = lode.global_position
		new_bullet.speed = current_mode.SPEED
		new_bullet.damage = current_mode.DAMAGE
		new_bullet.change_type("homing")
		pass
	else:
		var new_bullet = BULLET.instantiate()
		get_parent().add_child(new_bullet)
		new_bullet.rotation_degrees = rad_to_deg(angle)
		new_bullet.global_position = lode.global_position
		new_bullet.speed = current_mode.SPEED
		new_bullet.damage = current_mode.DAMAGE
		new_bullet.change_type("default")
	pass

func on_shoot_timeout():
	fire_bullet()
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	if area is ENEMY:
		if invul_timer.time_left >0 && !invul_timer.is_stopped():
			return
		if current_mode == SHOOT_MODE.DEFAULT:
			get_tree().change_scene_to_file("res://game/UI/menus/death_menu/deathscreen.tscn")
			
			##TODO trigger game end here
			pass
		else:
			#print("MARIO SHRINK SOUND")
			change_mode(SHOOT_MODE.DEFAULT)
			cooldown_timer.start()
			invul_timer.start()
		pass
	pass # Replace with function body.


func _on_cooldown_timer_timeout():
	#print('cooldown finished')
	cooldown_timer.wait_time = 5
	#cooldown_timer.
	pass # Replace with function body.


func _on_invul_timer_timeout():
	cooldown_timer.wait_time = 5
	pass # Replace with function body.

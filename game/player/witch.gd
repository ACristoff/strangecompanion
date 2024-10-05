extends CharacterBody2D

@onready var companion = $Companion
@onready var sprite = $Sprite2D

@export var SPEED = 300
@export var health = 100

enum SHOOT_MODE {
	BIG, 
	SPREAD, 
	HOMING
}

var current_mode = SHOOT_MODE.HOMING

var face_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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

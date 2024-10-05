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
	var horizontalDirection = Input.get_axis("move_left", "move_right")
	var verticalDirection = Input.get_axis("move_up", "move_down")
	
	if horizontalDirection:
		sprite.flip_h = (horizontalDirection == -1)
		face_right = (horizontalDirection == 1)
		pass
	
	velocity.x = horizontalDirection * SPEED
	velocity.y = verticalDirection * SPEED
	
	velocity = velocity.normalized()
	move_and_slide()
	pass

#Shooting from companion node

#Movement

#On Hit

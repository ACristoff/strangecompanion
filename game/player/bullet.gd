extends Node2D

@export var speed = 300
var type = 1

#var direction = global_transform.basis_xform(Vector2.RIGHT)
#var rotation_vector = Vector2.UP.rotated(rotation)
# Called when the node enters the scene tree for the first time.
func _ready():
	if type == 1:
		$crystal.visible = true
		$bigshot.visible = false
		$homing.visible = false
	elif type == 2:
		$crystal.visible = false
		$bigshot.visible = true
		$homing.visible = false
	elif type == 3:
		$crystal.visible = false
		$bigshot.visible = false
		$homing.visible = true
	$AnimationPlayer.play("crystal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	pass

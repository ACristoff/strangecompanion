extends Node2D

@export var speed = 300

#var direction = global_transform.basis_xform(Vector2.RIGHT)
#var rotation_vector = Vector2.UP.rotated(rotation)
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("crystal")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	pass

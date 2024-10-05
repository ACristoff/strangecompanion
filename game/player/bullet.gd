extends Node2D

@export var speed = 400
#var velocity = Vector2.RIGHT
#var velocity = Vector2.RIGHT
#var direction = global_transform.basis_xform(Vector2.RIGHT)
var rotation_vector = Vector2.UP.rotated(rotation)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position += rotation_vector * delta
	#print(rotation_vector)
	#position += velocity * delta
	#position.x += speed * delta
	#position += speed * delta
	#print(self.rotation)
	#move_and_slide()
	pass

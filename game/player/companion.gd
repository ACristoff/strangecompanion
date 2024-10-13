extends Node3D
class_name COMPANION

var d := 0.0
var radius := 2
var speed := 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	d += delta
	
	position = Vector3(
		sin(d * speed) * (radius + 0.5),
		0,
		cos(d * speed) * (radius - 0.5) ,
	)
	
	pass

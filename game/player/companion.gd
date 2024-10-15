extends Node3D
class_name COMPANION

var d := 0.0
var radius := 2
var speed := 2.0
var awake = false
var amount = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	d = 3.14159265358979/amount
	position = Vector3(
			sin(d * -speed) * (radius + 0.5),
			0,
			cos(d * -speed) * (radius - 0.5) ,
		)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if d >= 3.14159265358979:
		d = 0
	print(d)
	if awake == true:
		d += delta
		
		position = Vector3(
			sin(d * -speed) * (radius + 0.5),
			0,
			cos(d * -speed) * (radius - 0.5) ,
		)
	
	pass


func _on_timer_timeout() -> void:
	awake = true

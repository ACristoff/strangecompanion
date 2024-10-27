extends Node3D



var type = null
#var identification_number = 1
var d := 0.0
var radius := 2
var speed := 2.0
var awake = true
var amount = 1
var b = PI/CompanionManager.number_of_companions
var identification_number = 0



#func construct_companion(new_type):
	#type = new_type
	#$Sprite3D.texture = CompanionManager.companion_types[type].sprite





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	identification_number = CompanionManager.identification
	d = b * identification_number
	position = Vector3(
			sin(d * -speed) * (radius + 0.5),
			0,
			cos(d * -speed) * (radius - 0.5) ,
		)
	CompanionManager.construct_new_companion.connect(refresh_companions)
	identification_number = CompanionManager.identification
	$Label3D.text = str(identification_number)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if d >= 3.14159265358979:
		d = 0
	#print(d)
	if awake == true:
		d += delta
		
		position = Vector3(
			sin(d * -speed) * (radius + 0.5),
			0,
			cos(d * -speed) * (radius - 0.5) ,
		)
	
	
	
func refresh_companions():
	queue_free()

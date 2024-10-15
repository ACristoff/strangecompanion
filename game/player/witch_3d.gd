extends CharacterBody3D

const SPEED = 5.0
var COMPANION = preload("res://game/player/companion.tscn")

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_button_pressed() -> void:
	var new_fren = COMPANION.instantiate()
	add_child(new_fren)
	new_fren.construct_companion("banana")
	


func _on_button_2_pressed() -> void:
	var new_fren = COMPANION.instantiate()
	add_child(new_fren)
	new_fren.construct_companion("strawberry")


func _on_button_3_pressed() -> void:
	var new_fren = COMPANION.instantiate()
	add_child(new_fren)
	new_fren.construct_companion("pineapple")


func _on_button_4_pressed() -> void:
	var new_fren = COMPANION.instantiate()
	add_child(new_fren)
	new_fren.construct_companion("watermelon")

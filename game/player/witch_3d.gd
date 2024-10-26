extends CharacterBody3D

@onready var camera = $Camera3D

const SPEED = 5.0
var companion = preload("res://game/player/companion.tscn")
@export var joined_companions : Array[String] = []
@export var parent_node = self
var debug_mode := true

func _ready() -> void:
	pass
	

func _physics_process(_delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#var direction = (Vector3(input_dir.x, 0, input_dir.y))
	if debug_mode == true && Input.is_action_just_pressed("debug_scroll_down"):
		camera.fov += 5
		camera.position.y += 5
		pass
	elif debug_mode == true && Input.is_action_just_pressed("debug_scroll_up"):
		camera.fov -= 5
		camera.position.y -= 5
		pass
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()


func _on_button_pressed() -> void:
	refresh_companions("banana")


func _on_button_2_pressed() -> void:
	refresh_companions("pineapple")


func _on_button_3_pressed() -> void:
	refresh_companions("strawberry")


func _on_button_4_pressed() -> void:
	refresh_companions("watermelon")
	
func refresh_companions(type):
	joined_companions.append(type)
	#deletes current companions
	CompanionManager.refresh_companions_manager()
	CompanionManager.identification = 0
	CompanionManager.number_of_companions += 1
	for item in joined_companions:
		CompanionManager.identification += 1
		var new_fren = companion.instantiate()
		parent_node.add_child(new_fren)
		new_fren.construct_companion(item)
	#print(joined_companions)
	

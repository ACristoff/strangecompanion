extends CharacterBody3D

@onready var camera = $Camera3D

const SPEED = 5.0
var companion = preload("res://game/player/companion.tscn")
var companion_visuals = preload("res://game/player/com_visuals.tscn")
#@export var joined_companions : Array[String] = []
@export var parent_node = self
var debug_mode := true
var buffer = 0

func _ready() -> void:
	CompanionManager.give_follow_point.connect(set_reference)
	

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
	receive_companion_create_request("banana")


func _on_button_2_pressed() -> void:
	receive_companion_create_request("pineapple")


func _on_button_3_pressed() -> void:
	receive_companion_create_request("strawberry")


func _on_button_4_pressed() -> void:
	receive_companion_create_request("watermelon")
	
func receive_companion_create_request(type):
	## MAKES IT EASIER TO CREATE COMPANIONS
	CompanionManager.give_follow_point.emit("CHANGE THIS YAHOO")
	refresh_companions(str(type))
	
	
func refresh_companions(type):
	CompanionManager.joined_companions.append(type)
	#deletes current companions
	CompanionManager.refresh_companions_manager()
	CompanionManager.identification = 0
	buffer = 0
	CompanionManager.number_of_companions += 1
	for item in CompanionManager.joined_companions:
		CompanionManager.identification += 1
		buffer += 1
		var new_fren = companion.instantiate()
		parent_node.add_child(new_fren)
		if buffer == CompanionManager.number_of_companions:
			print("spawn new!")
			var new_fren_visuals = companion_visuals.instantiate()
			parent_node.add_child(new_fren_visuals)
			new_fren_visuals.construct_companion(item)
			new_fren_visuals.update_position(new_fren.global_position, CompanionManager.identification)
	#print(joined_companions)
	
func set_reference(position):
	print(position)

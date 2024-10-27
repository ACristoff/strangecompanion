extends Node3D

@export var following_currently: Node3D
var type = null
var identification_number = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	identification_number = CompanionManager.identification
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func construct_companion(new_type):
	type = new_type
	$Sprite3D.texture = CompanionManager.companion_types[type].sprite
func update_position(position, idNum):
	print(position)
	print(idNum)

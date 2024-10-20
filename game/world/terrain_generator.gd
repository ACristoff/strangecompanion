extends Node3D

@export var player = Node3D

var player_position = Vector2()

@onready var terrain = $MeshInstance3D.mesh.size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_position.x = player.global_position.x
	player_position.y = player.global_position.y
	
	if player_position <= terrain:
		print("morethan")
	elif player_position >= terrain:
		print("lessthan")
	else:
		print("inside")

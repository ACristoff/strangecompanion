extends Node3D

@export var player = Node3D
@onready var chunk = preload("res://game/world/chunk.tscn")
@onready var terrain = Vector2(10, 10)

var player_position = Vector2()

var new_cell = Vector2(0,0)
var player_cell_position = Vector2(0,0)

##TODO
var cells = []
var active_cells = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func generate_new_cell(cell):
	var new_chunk := chunk.instantiate()
	var chunk_pos_2d = get_global_coordinates(cell)
	var chunk_pos = Vector3(
		chunk_pos_2d.x,
		0,
		chunk_pos_2d.y
	)
	self.add_child(new_chunk)
	new_chunk.global_position = chunk_pos
	pass

func get_player_cell(player_coordinates):
	var offset_coords = player_coordinates - terrain
	var divided = offset_coords / (terrain * 2)
	var cell = Vector2(floor(divided.x), floor(divided.y))
	var offset_cell = cell + Vector2(1, 1)
	return offset_cell

func get_global_coordinates(cell_coordinate):
	var global_coord = Vector2(cell_coordinate.x * (terrain.x * 2), cell_coordinate.y * (terrain.y * 2))
	return global_coord

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_position.x = player.global_position.x
	player_position.y = player.global_position.z
	
	new_cell = get_player_cell(player_position)
	
	if new_cell != player_cell_position:
		player_cell_position = new_cell
		generate_new_cell(player_cell_position)
		pass

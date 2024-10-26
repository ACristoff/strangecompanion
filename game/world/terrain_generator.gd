extends Node3D

@export var player = Node3D

@onready var chunk = preload("res://game/world/chunk.tscn")
@onready var terrain = Vector2(20, 20)

var player_position = Vector2()

var new_cell = Vector2(0,0)
var player_cell_position = Vector2(0,0)

##Vector2: Data
var inactive_cells = {
	
}
##Vector2: Node
var active_cells = {
	
}

enum CELL_STATES {ACTIVE, INACTIVE, NULL}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("init load")
	load_cells_at(Vector2(0,0))
	pass # Replace with function body.

func unload_cells_from(origin):
	#print()
	for cell in active_cells.keys():
		#print(cell.x)
		##If the cell is more than one away, unload it
		if cell.x > origin.x + 1 || cell.x < origin.x - 1 || cell.y > origin.y + 1 || cell.y < origin.y - 1:
			active_cells[cell].queue_free()
			active_cells.erase(cell)
			##TODO add props to inactive list here and save the prop data in the list
			inactive_cells[cell] = {}
		pass
	pass

func load_cells_at(cell):
	for i in 3:
		for j in 3:
			var position_to_check = Vector2(cell.x + (i - 1), cell.y + (j - 1))
			var position_status = cell_checker(position_to_check)
			
			##The cell exists and nothing needs to be done for now
			if position_status == CELL_STATES.ACTIVE:
				#prints(position_to_check, "ACTIVE")
				pass
			##The cell doesn't exist and will be generated here
			elif position_status == CELL_STATES.NULL:
				generate_new_cell(position_to_check)
				#prints(position_to_check, "NULL")
			##The cell exists, but isn't loaded and will be loaded in here
			elif position_status == CELL_STATES.INACTIVE:
				#prints(position_to_check, "INACTIVE")
				##TODO load cells here replace generate cell
				generate_new_cell(position_to_check)
				pass
			pass
	#print(active_cells)
	pass

func cell_checker(cell):
	if active_cells.has(cell):
		return CELL_STATES.ACTIVE
	##TODO Refactor this for loading
	if inactive_cells.has(cell):
		return CELL_STATES.INACTIVE
	return CELL_STATES.NULL

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
	active_cells[cell] = new_chunk
	#prints(cell, "GENERATED!")
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
func _process(_delta: float) -> void:
	player_position.x = player.global_position.x
	player_position.y = player.global_position.z
	
	new_cell = get_player_cell(player_position)
	
	##This means the player has entered a new cell
	if new_cell != player_cell_position:
		player_cell_position = new_cell
		load_cells_at(new_cell)
		unload_cells_from(new_cell)
		#generate_new_cell(player_cell_position)
		pass

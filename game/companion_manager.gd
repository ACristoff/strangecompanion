extends Node



var companion_types =  {
	"LODEY": {
		"sprite": load("res://Assets/Player/lodey.png"),
	},
	"STABBEY": {
		"sprite": load("res://Assets/Debug_Assets/stabbey_sketch.png"),
	},
	"MAMI": {
		"sprite": load("res://Assets/Debug_Assets/mami_sketch.png"),
	},
	"KANON": {
		"sprite": load("res://Assets/Debug_Assets/kanon_sketch.png"),
	},
	"HACKE":{
		"sprite": load("res://Assets/Debug_Assets/hacke_sketch.png"),
	},
	"DUNE": {
		"sprite": load("res://Assets/Debug_Assets/dune_sketch.png"),
	},
	"RIFF":{
		"sprite": load("res://Assets/Debug_Assets/riff_sketch.png"),
	},
	"OORA":{
		"sprite": load("res://Assets/Debug_Assets/oora_sketch.png"),
	},
	"NYAO": {
		"sprite": load("res://Assets/Debug_Assets/nyao_sketch.png"),
	},
}

var joined_companions : Array[String] = ["STABBEY"]
var joined_items : Array[String] = []
var joined_gems : Array[String] = []
var number_of_companions = 0
var identification = 0

signal construct_new_companion
signal give_follow_point
signal card_clicked
signal createDoll
signal createItem
signal createGem
signal queueManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(number_of_companions)
	pass

func create_doll_request(nameCard):
	if companion_types.has(nameCard):
		emit_signal("createDoll", nameCard)
	else:
		pass

func refresh_companions_manager():
	emit_signal("construct_new_companion")
#func send_follow_point():
	#emit_signal("give_follow_point")
func burn_cards():
	emit_signal("card_clicked")

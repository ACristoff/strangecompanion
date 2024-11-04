extends Node



var companion_types =  {
	"LODEY": {
		"sprite":"res://Assets/Player/lodey.png",
	},
	"STABBEY": {
		"sprite": load("res://Assets/Debug_Assets/stabbey_sketch.png"),
	},
	"MAMI": {
		"sprite":"res://Assets/Debug_Assets/mami_sketch.png",
	},
	"KANON": {
		"sprite":"res://Assets/Debug_Assets/kanon_sketch.png",
	},
	"HACKE":{
		"sprite":"res://Assets/Debug_Assets/hacke_sketch.png",
	},
	"DUNE": {
		"sprite":"res://Assets/Debug_Assets/dune_sketch.png",
	},
	"RIFF":{
		"sprite":"res://Assets/Debug_Assets/riff_sketch.png",
	},
	"OORA":{
		"sprite":"res://Assets/Debug_Assets/oora_sketch.png",
	},
	"NYAO": {
		"sprite":"res://Assets/Debug_Assets/nyao_sketch.png",
	},
}

var joined_companions : Array[String] = []
var joined_items : Array[String] = []
var joined_gems : Array[String] = []
var number_of_companions = 0
var identification = 0

signal construct_new_companion
signal give_follow_point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(number_of_companions)
	pass

func refresh_companions_manager():
	emit_signal("construct_new_companion")
#func send_follow_point():
	#emit_signal("give_follow_point")

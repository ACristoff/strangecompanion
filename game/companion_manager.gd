extends Node

var bana = preload("res://Assets/Debug_Assets/stabbey_sketch.png")
var stawbewwy = preload("res://Assets/Debug_Assets/mami_sketch.png")
var pinable = preload("res://Assets/Debug_Assets/kanon_sketch.png")
var melahn = preload("res://Assets/Debug_Assets/hacke_sketch.png")

var companion_types =  {
	"banana": {
		"sprite":bana,
	},
	"strawberry": {
		"sprite":stawbewwy,
	},
	"pineapple": {
		"sprite":pinable,
	},
	"watermelon": {
		"sprite":melahn,
	},
}

var joined_companions : Array[String] = []
var number_of_companions = 0
var identification = 0

signal construct_new_companion
signal give_follow_point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(number_of_companions)
	pass

func refresh_companions_manager():
	emit_signal("construct_new_companion")
#func send_follow_point():
	#emit_signal("give_follow_point")

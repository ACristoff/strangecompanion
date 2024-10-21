extends Node3D

var bana = preload("res://Assets/Debug_Assets/stabbey_sketch.png")
var stawbewwy = preload("res://Assets/Debug_Assets/mami_sketch.png")
var pinable = preload("res://Assets/Debug_Assets/kanon_sketch.png")
var melahn = preload("res://Assets/Debug_Assets/hacke_sketch.png")

var type = null
var identification_number = 1


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

func construct_companion(new_type):
	type = new_type
	$LodeyParent/Sprite3D.texture = companion_types[new_type].sprite





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CompanionManager.construct_new_companion.connect(refresh_companions)
	identification_number = CompanionManager.identification
	$LodeyParent/Label3D.text = str(identification_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func refresh_companions():
	queue_free()

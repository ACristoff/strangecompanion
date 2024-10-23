extends Control

@onready var CARD = preload("res://game/UI/menus/card.tscn")
@export var parent_node = self

var stabbey_copies = 0
var grove_copies = 0
var lodey_copies = 0
var mami_copies = 0
var kanon_copies = 0
var hacke_copies = 0
var dune_copies = 0
var riff_copies = 0
var nyao_copies = 0
var oora_copies = 0
var bawl_copies = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_card = CARD.instantiate()
	parent_node.add_child(new_card)
	#new_card.construct_companion()
	
	var card1 = randi_range(1, 10)
	var card2 = randi_range(1, 10)
	var card3 = randi_range(1, 10)
	
	if card1 >= 5:
		print("greater")
	elif card1 < 5:
		print("lesser")
	if card2 >= 5:
		pass
	elif card2 < 5:
		pass
	if card3 >= 5:
		pass
	elif card3 > 5:
		pass
	
	
	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

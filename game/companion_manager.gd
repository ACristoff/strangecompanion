extends Node


var number_of_companions = 0
var identification = 0

signal construct_new_companion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(number_of_companions)
	pass

func refresh_companions_manager():
	emit_signal("construct_new_companion")

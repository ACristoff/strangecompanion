extends Node3D

@export var companions_owned : Array[Node3D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func spawn_companion():
	
	pass

func update_companion():
	print(companions_owned)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#update_companion()
	pass

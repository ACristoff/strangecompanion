extends Area2D

@export var speed = 40
@onready var visible_notifier = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("THEREFORE I AM")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x += speed*delta
	#print(global_position)
	pass

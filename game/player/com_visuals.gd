extends Node3D

@export var following_currently: Node3D
var type = null
var identification_number = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CompanionManager.give_follow_point.connect(set_reference)
	identification_number = CompanionManager.identification
	pass # Replace with function body.

func set_reference(new_fren):
	if identification_number == CompanionManager.identification:
		following_currently = new_fren
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if following_currently:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.set_process_mode(0)
		tween.tween_property(self, "global_position", following_currently.global_position, 0.1)

func construct_companion(new_type):
	type = new_type
	$Sprite3D.texture = CompanionManager.companion_types[type].sprite

func update_position(new_position, idNum):
	print(new_position)
	print(idNum)
#func set_reference(new_fren):
	#following_currently = new_fren
	

extends Node3D

var type = null
var identification_number = 1

func _ready() -> void:
	#CompanionManager.construct_new_companion.connect(refresh_companions)
	identification_number = CompanionManager.identification
	$LodeyParent/Label3D.text = str(identification_number)
#no code, only used for positioning

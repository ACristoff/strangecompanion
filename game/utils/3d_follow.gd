extends Control

@export var target: Node3D
var offset_3d = Vector3(0,-0.5,-2)

##TODO make the control node disappear and appear after having its new position set to stop the top left blinking or move it

func _process(_delta):
	var pos_3d = target.global_position + offset_3d
	var cam = get_viewport().get_camera_3d()
	var pos_2d = cam.unproject_position(pos_3d)
	global_position = pos_2d
	visible = not cam.is_position_behind(pos_3d)
	pass

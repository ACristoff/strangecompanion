extends Sprite2D

func _ready():
	GlobalPos.player = self

func _exit_tree():
	GlobalPos.player = null

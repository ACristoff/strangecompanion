extends CanvasLayer

var WINDOW = preload("res://game/UI/menus/upgrade_menu/upgrades.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#JuicyDetails.openshop.connect(upgrades)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func upgrades():
	var new_shop = WINDOW.instantiate()
	get_parent().add_child(new_shop)

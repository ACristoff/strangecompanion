extends Node

var bar_1 = 0
var bar_2 = 0
var bar_3 = 0
var bar_1_selected = false
var bar_2_selected = false
var bar_3_selected = false
var outfit = 0
var score = 1
var player_speed = 300
var player_damage = 10
var player_shotspeed = 20



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _addenergy(amount):
	if bar_1_selected == true:
		bar_1 += amount
	elif bar_2_selected == true:
		bar_2 += amount
	elif bar_3_selected == true:
		bar_3 += amount
	else:
		var bar = randi_range(1,3)
		if bar == 1:
			bar_1 += amount
		if bar == 2:
			bar_2 += amount
		if bar == 3:
			bar_3 += amount
	

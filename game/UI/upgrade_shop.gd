extends Control

var essence_amount_1: int = 0
var essence_amount_2: int = 0
var essence_amount_3: int = 0  # Fixed typo

func _ready() -> void:  # Fixed missing underscore
	$EssenceMeter_1.value = essence_amount_1  
	$EssenceMeter_2.value = essence_amount_2
	$EssenceMeter_3.value = essence_amount_3  



func _on_upgrade_1_pressed(upgrade_cost: int, upgrade_type: int) -> void:
	match upgrade_type:
		1:
			if essence_amount_1 >= upgrade_cost:
				essence_amount_1 -= upgrade_cost
				apply_upgrade(upgrade_type)
				
		2:
			if essence_amount_2 >= upgrade_cost:
				essence_amount_2 -= upgrade_cost
				apply_upgrade(upgrade_type)
				
		3:
			if essence_amount_3 >= upgrade_cost:
				essence_amount_3 -= upgrade_cost
				apply_upgrade(upgrade_type)
				
func  apply_upgrade(upgrade_type: int) -> void:
	pass

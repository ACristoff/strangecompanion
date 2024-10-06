extends Node2D


	
func _process(delta: float) -> void:
	#print(JuicyDetails.bar_1)
	$Node/EssenceMeter_1.value = JuicyDetails.bar_1
	$Node/EssenceMeter_2.value = JuicyDetails.bar_2
	$Node/EssenseMeter_3.value = JuicyDetails.bar_3

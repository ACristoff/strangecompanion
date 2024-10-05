extends Node

var player = null
var enemy1 = preload("res://game/enemies/base_enemy.tscn")


# returns the position of node so the enemy can chase it
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


#spawn enemies randomly
func _on_enemy_spawn_timer_timeout() -> void:
	# i have no idea what the ranges should be
	var enemy_pos = Vector2(randi_range(-150, 1250), randi_range(-150, 800))
	
	while enemy_pos.x < 1200 and enemy_pos.x > -75 or enemy_pos.y > -75 and enemy_pos.y < 750:
		enemy_pos = Vector2(randi_range(-150, 1250), randi_range(-150, 800))
	
	instance_node(enemy1, enemy_pos, self)

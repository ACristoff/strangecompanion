extends Node

var player = null
var enemy1 = preload("res://game/enemies/base_enemy.tscn")
var enemy2 = preload("res://game/enemies/enemy_2.tscn")

# farthest it can spawn 
var minPosX = -270
var maxPosX = 1350

var minPosY = -150
var maxPosY = 1250

# returns the position of node so the enemy can chase it
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


#spawn enemies randomly
func _on_enemy_spawn_timer_timeout() -> void:
	# i have no idea what the ranges should be
	var enemy_pos = Vector2(randi_range(minPosX, maxPosX), randi_range(minPosY, maxPosY))
	
	while enemy_pos.x > 0 and enemy_pos.x < 1150:
		enemy_pos = Vector2(randi_range(minPosX, maxPosX), enemy_pos.y)
	
	var choice = randi_range(1,10)
	if choice <= 5:
		instance_node(enemy1, enemy_pos, self)
		choice = randi_range(1,10)
	else:
		instance_node(enemy2, enemy_pos, self)
		choice = randi_range(1,10)

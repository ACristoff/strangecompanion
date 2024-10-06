extends Node

var player = null
var enemy1 = preload("res://game/enemies/base_enemy.tscn")

@export var playerpos: CharacterBody2D

# farthest it can spawn 
var xDist = 700

var yDist = 700

# returns the position of node so the enemy can chase it
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


#spawn enemies randomly
func _on_enemy_spawn_timer_timeout() -> void:
# you know? this was organized and pretty but godot crashed about 7 times so now it's this
	var playerX = playerpos.global_position.x
	var playerY = playerpos.global_position.y
	var playerVect = Vector2(playerX, playerY)
	
# generate initial enemy start
	var enemy_pos = Vector2(randi_range(playerX - xDist, playerX + xDist), randi_range(playerY - yDist, playerY + yDist))
	
	while enemy_pos.distance_to(playerVect) < 500:
		enemy_pos = Vector2(randi_range(playerX - xDist, playerX + xDist), randi_range(playerY - yDist, playerY + yDist))
	
	var new_enemy = instance_node(enemy1, enemy_pos, self)
	var choice = randi_range(1,10)
	
	if choice <= 3:
		new_enemy.construct_enemy("biggie")
		pass
	else:
		new_enemy.construct_enemy("smalls")
		pass

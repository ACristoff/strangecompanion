
extends Node3D

#@export var player = Node3D
@onready var mob_spawn_location = $MobSpawnBox/MobSpawnLocation
@onready var mob_spawn_box = $MobSpawnBox
var basic_enemy = preload("res://game/enemies/base_enemy_3d.tscn")


func _process(_delta):
	if GameManager.player != null:
		#print()
		mob_spawn_box.global_position = GameManager.player.global_position + Vector3(-10, 0, -10)
		pass
	
	#mob_spawn_box.global_positon = player.global_position
	#if player != null:
		#prints(player.global_position)
		#prints(self.global_position)
		#pass
	pass

func _on_mob_timer_timeout():
	var mob = basic_enemy.instantiate()
	mob_spawn_location.progress_ratio = randf()
	mob.global_position = mob_spawn_location.global_position
	add_child(mob)
	prints("Mob spawn", mob_spawn_location.global_position)
	pass # Replace with function body.

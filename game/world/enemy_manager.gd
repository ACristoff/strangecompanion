
extends Node3D

@onready var mob_spawn_location = $MobSpawnBox/MobSpawnLocation
@onready var mob_spawn_box = $MobSpawnBox
##TODO Change this eventually
var basic_enemy = preload("res://game/enemies/base_enemy_3d.tscn")

@export var wave_data: Array[Wave] = []
var current_wave = 0
# Time Start
# Time End
# Enemy Type(s?)
# Enemy Count
# Spawn Delay

func _process(_delta):
	if GameManager.player != null:
		mob_spawn_box.global_position = GameManager.player.global_position + Vector3(-35, 0, -25)
		pass
	pass

func _on_mob_timer_timeout():
	var mob = basic_enemy.instantiate()
	mob_spawn_location.progress_ratio = randf()
	mob.global_position = mob_spawn_location.global_position
	add_child(mob)
	#prints("Mob spawn", mob_spawn_location.global_position)

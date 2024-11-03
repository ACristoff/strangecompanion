
extends Node3D

@onready var mob_spawn_location = $MobSpawnBox/MobSpawnLocation

var basic_enemy = null



func _on_mob_timer_timeout():
	
	var mob = null
	
	#spawn a guy
	mob_spawn_location.progress_ratio = randf()
	
	#mob.position = mob_spawn_location
	
	#add_child(mob)
	
	prints("Mob spawn", mob_spawn_location.position)
	pass # Replace with function body.

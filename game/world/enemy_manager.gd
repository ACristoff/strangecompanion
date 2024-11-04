
extends Node3D

@onready var mob_spawn_location = $MobSpawnBox/MobSpawnLocation
@onready var mob_spawn_box = $MobSpawnBox
@onready var mob_timer = $MobTimer
@onready var wave_timer = $WaveTimer
##TODO Change this eventually
#var basic_enemy = preload("res://game/enemies/base_enemy_3d.tscn")


@export var wave_data: Array[Wave] = []
var current_wave = 0
var enemy_count = 0

func _ready():
	wave_update(wave_data[current_wave])
	pass

func wave_update(wave):
	#prints(wave.spawn_delay)
	mob_timer.wait_time = wave.spawn_delay
	wave_timer.wait_time = wave.time_end
	wave_timer.start()
	#prints(wave_timer.wait_time)
	pass

func _process(_delta):
	if GameManager.player != null:
		mob_spawn_box.global_position = GameManager.player.global_position + Vector3(-35, 0, -25)
	pass

func _on_mob_timer_timeout():
	if !wave_timer.is_stopped():
		var mob = basic_enemy.instantiate()
		mob_spawn_location.progress_ratio = randf()
		add_child(mob)
		mob.global_position = mob_spawn_location.global_position


func _on_wave_timer_timeout():
	print("wave finished")
	pass # Replace with function body.


extends Node3D

@onready var mob_spawn_location = $MobSpawnBox/MobSpawnLocation
@onready var mob_spawn_box = $MobSpawnBox
@onready var mob_timer = $MobTimer
@onready var wave_timer = $WaveTimer
@onready var wave_delay_timer = $WaveDelayTimer


@export var wave_data: Array[Wave] = []
var current_wave = 0
var enemy_count = 0

func _ready():
	wave_update(wave_data[current_wave])
	pass

func _on_wave_delay_timer_timeout():
	wave_timer.start()
	mob_timer.start()
	pass # Replace with function body.

func wave_update(wave):
	mob_timer.stop()
	mob_timer.wait_time = wave.spawn_delay
	wave_timer.wait_time = wave.time_end
	
	wave_delay_timer.wait_time = wave.time_start
	wave_delay_timer.start()
	pass

func _process(_delta):
	if GameManager.player != null:
		mob_spawn_box.global_position = GameManager.player.global_position + Vector3(-35, 0, -25)
	pass

func _on_mob_timer_timeout():
	if !wave_timer.is_stopped() && enemy_count <=  wave_data[current_wave].enemy_count:
		var mob = wave_data[current_wave].enemy.instantiate()
		mob_spawn_location.progress_ratio = randf()
		add_child(mob)
		mob.global_position = mob_spawn_location.global_position
		enemy_count += 1

func _on_wave_timer_timeout():
	print("wave finished")
	current_wave += 1
	wave_update(wave_data[current_wave])
	pass # Replace with function body.

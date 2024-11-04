class_name BaseEnemy
extends RigidBody3D

var max_health = 100
var health = max_health
var attack = 10
var speed = 5
var target = GameManager.player

#Take Damage
	#Update HealthBar
func take_damage(damage):
	health -= damage
	if health <= 0:
		die()
		pass
	pass

#Do Damage
func do_damage():
	prints("deal damage!", attack)
	pass

#Die
func die():
	var dropped_value = (4 * attack + 2 * max_health) / 100
	var new_exp_orb = GameManager.exp_orb.instantiate()
	new_exp_orb.exp_value = dropped_value
	GameManager.world.add_child(new_exp_orb)
	print('die! drop XP', dropped_value)
	queue_free()

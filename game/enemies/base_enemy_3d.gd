class_name BaseEnemy
extends RigidBody3D

var health = 100
var attack = 10
var speed = 5
var target = GameManager.player


#Take Damage
	#Update HealthBar
func take_damage(damage):
	pass

#Do Damage
func do_damage():
	pass

#Die
func die():
	queue_free()

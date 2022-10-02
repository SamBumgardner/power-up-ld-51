extends Node2D

class_name PatternBase

export var duration = 1.0
var total_elapsed = 0
var bullet_collision_mask = 0b0000

onready var cannons = get_cannons()

func get_cannons():
	return []

func _physics_process(delta):
	var end_time = total_elapsed + delta
	
	for cannon in cannons:
		cannon.try_shoot(total_elapsed, end_time)
	
	total_elapsed = end_time
	if total_elapsed >= duration:
		total_elapsed -= duration

extends Node2D

class_name PatternBase

export var duration = 1.0
var total_elapsed = 0
export(int, LAYERS_2D_PHYSICS) var bullet_collision_mask = 0b0000

onready var cannons = get_cannons()

func _init(_bullet_collision_mask:int):
	bullet_collision_mask = _bullet_collision_mask

func get_cannons():
	return []

func _ready():
	var gameplay_node:Node = get_node("/root/Gameplay")
	var projectile_pool:ProjectilePool = gameplay_node.get("projectile_pool")
	
	for cannon in cannons:
		cannon.connect("fired_projectile", projectile_pool, "_on_fired_projectile")

func _physics_process(delta):
	var end_time = total_elapsed + delta
	
	for cannon in cannons:
		cannon.try_shoot(total_elapsed, end_time)
	
	total_elapsed = end_time
	if total_elapsed >= duration:
		total_elapsed -= duration

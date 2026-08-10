extends Node2D

## Base pattern class that may fire bullets every second.
class_name PatternBase

@export var duration = 1.0
var total_elapsed = 0
@export var bullet_collision_mask = 0b0000 # (int, LAYERS_2D_PHYSICS)

@onready var cannons = get_cannons()

func _init(_bullet_collision_mask:int = 0b0000):
	bullet_collision_mask = _bullet_collision_mask

func get_cannons():
	return []

func _ready():
	var gameplay_node:Node = get_node_or_null("/root/Gameplay")
	var projectile_pool:ProjectilePool

	if gameplay_node:
		projectile_pool = gameplay_node.get("projectile_pool")
	else:
		print_debug('WARNING: Creating a ProjectilePool.gd locally for debugging PatternBase.gd.')
		projectile_pool = preload("res://ProjectilePool.gd").new()
	
	for cannon in cannons:
		cannon.connect("fired_projectile", Callable(projectile_pool, "_on_fired_projectile"))

func _physics_process(delta):
	var end_time = total_elapsed + delta
	
	for cannon in cannons:
		cannon.try_shoot(total_elapsed, end_time)
	
	total_elapsed = end_time
	if total_elapsed >= duration:
		total_elapsed -= duration

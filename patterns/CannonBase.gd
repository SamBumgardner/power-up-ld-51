extends RefCounted

class_name CannonBase

signal fired_projectile

var pattern_parent:Node2D
var pattern_duration:float
var pattern_collision:int

@export var projectile_sprite_frame = 0
@export var base_velocity:float = 250
var projectile_infos:Array
var calc_vector:Vector2 = Vector2(1, 0)

func _init(_pattern_parent:Node2D, _pattern_duration:float, _pattern_collision:int, _projectile_infos:Array):
	print_debug('DEBUG05 initialize cannon with:', _pattern_parent, _pattern_duration, _pattern_collision, _projectile_infos)
	pattern_parent = _pattern_parent
	pattern_duration = _pattern_duration
	pattern_collision = _pattern_collision
	
	projectile_infos = _projectile_infos
	pass

func try_shoot(start_time, end_time):
	# print_debug('DEBUG06 trying to shoot at time with projectiles:', start_time, projectile_infos)
	for projectile_info in projectile_infos:
		# Prints too many times and crashes the game.
		# print_debug('DEBUG07 projectile checking if it can shoot at:', start_time)
		if (start_time < projectile_info.shoot_time and end_time > projectile_info.shoot_time) \
				or (end_time > pattern_duration and fmod(end_time, pattern_duration)  > projectile_info.shoot_time):
			# Adding a return prevents a crash, likely from an infinite loop error.
			# Returning early correctly gets reached when a bullet should be fired.
			# print_debug('DEBUG08 shooting at time:', start_time)
			# return
			populate_velocity(projectile_info)
			
			# Break out of the loop after firing a projectile.
			return
			
			# Signal `fired_projectile` seems to be able to crash the game.
			emit_signal("fired_projectile", pattern_parent.global_position, 
				projectile_info.velocity, pattern_collision,
				projectile_sprite_frame)
			# Break out of the loop after firing a projectile.
			# Too late and crashes the game.
			# return

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.velocity_modifier

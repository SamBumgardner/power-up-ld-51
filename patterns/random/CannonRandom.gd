extends CannonBase

class_name CannonRandom

#func _init(_pattern_parent:Node2D, _pattern_duration:float,
#		_pattern_collision:int, _projectile_infos:Array):
#	pass

#func _init(_pattern_parent:Node2D, _pattern_duration:float,
#		_pattern_collision:int, _projectile_infos:Array):
#	print_debug('DEBUG11 initialize cannon with:', _pattern_parent, _pattern_duration, _pattern_collision, _projectile_infos)
#	# Probably creates an infinite loop with `super` of constructor calls.
#	#super(_pattern_parent, _pattern_duration,
#	#	_pattern_collision, _projectile_infos)
#	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT.rotated(randf() * PI * 2)
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

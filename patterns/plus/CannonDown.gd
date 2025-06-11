extends CannonBase

class_name CannonDown

func _init(_pattern_parent:Node2D, _pattern_duration:float,
		_pattern_collision:int, _projectile_infos:Array):
	pattern_parent = _pattern_parent
	pattern_duration = _pattern_duration
	pattern_collision = _pattern_collision
	
	projectile_infos = _projectile_infos

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.DOWN
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

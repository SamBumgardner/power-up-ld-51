extends CannonBase

class_name CannonLeft

func _init(_pattern_parent:Node2D, _pattern_duration:float, _pattern_collision:int, _projectile_infos:Array) \
		.(_pattern_parent, _pattern_duration, _pattern_collision, _projectile_infos):
	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.LEFT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

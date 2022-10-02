extends CannonBase

class_name CannonRandom

func _init(_pattern_duration:float, _pattern_position:Vector2, _pattern_collision:int) \
		.(_pattern_duration, _pattern_position, _pattern_collision):
	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector.rotated(randf() * PI * 2)

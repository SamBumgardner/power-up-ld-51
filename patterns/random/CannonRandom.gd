extends CannonBase

class_name CannonRandom

func _init(_pattern_parent:Node2D, _pattern_duration:float, _pattern_collision:int) \
		.(_pattern_parent, _pattern_duration, _pattern_collision):
	projectile_infos = [ProjectileInfo.new(1, 1)]
	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT.rotated(randf() * PI * 2)
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

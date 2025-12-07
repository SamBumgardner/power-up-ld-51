extends CannonBase

## Cannon class to try firing one bullet right/East.
class_name CannonRight

func _init(_pattern_parent:Node2D, _pattern_duration:float,
		_pattern_collision:int, _projectile_infos:Array):
	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

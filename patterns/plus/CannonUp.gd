extends CannonBase

## Cannon class to try firing one bullet up/North.
class_name CannonUp

func _init(_pattern_parent:Node2D, _pattern_duration:float,
		_pattern_collision:int, _projectile_infos:Array):
	pass

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.UP
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

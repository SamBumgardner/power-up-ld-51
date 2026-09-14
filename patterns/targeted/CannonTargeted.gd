extends CannonBase

## Cannon class to try firing bullets.
## Usually uses a [PatternTargeted] pattern.
class_name CannonTargeted

var target_node:Node2D

func _init(_pattern_parent:Node2D, _pattern_duration:float,
		_pattern_collision:int, _projectile_infos:Array, _target_node:Node2D):
	target_node = _target_node

	super(_pattern_parent, _pattern_duration,
		_pattern_collision, _projectile_infos)

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT.rotated(pattern_parent.get_angle_to(target_node.global_position))
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

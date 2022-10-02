extends CannonBase

class_name CannonTargeted

var target_node:Node2D

func _init(_pattern_parent:Node2D, _pattern_duration:float, _pattern_collision:int, _target_node:Node2D) \
		.(_pattern_parent, _pattern_duration, _pattern_collision):
	target_node = _target_node
	projectile_infos = [ProjectileInfo.new(1, 1)]

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT.rotated(pattern_parent.get_angle_to(target_node.global_position))
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

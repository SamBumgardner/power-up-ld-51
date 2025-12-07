extends RefCounted

## Base cannon class to try firing one bullet at a time.
##
## How often and in which direction bullets fire is usually defined by
##  an extension of [PatternBase].
## Complex patterns may be defined with a list of cannons deciding
##  individual bullet vectors.
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
	pattern_parent = _pattern_parent
	pattern_duration = _pattern_duration
	pattern_collision = _pattern_collision
	
	projectile_infos = _projectile_infos
	pass

func try_shoot(start_time, end_time):
	if projectile_infos.is_empty():
		var mock_projectile = ProjectileInfo.new(1, 1)
		var mock_vector = Vector2.RIGHT.rotated(randf() * PI * 2)
		var mock_velocity = mock_vector * base_velocity * mock_projectile.speed
		mock_projectile.velocity = mock_velocity
		projectile_infos.push_back(mock_projectile)

	for projectile_info in projectile_infos:
		if (start_time < projectile_info.shoot_time and end_time > projectile_info.shoot_time) \
				or (end_time > pattern_duration and fmod(end_time, pattern_duration)  > projectile_info.shoot_time):
			
			populate_velocity(projectile_info)

			if pattern_parent == null:
				pattern_parent = Node2D.new()
				var mock_vector = Vector2.RIGHT.rotated(randf() * PI * 2)
				pattern_parent.global_position = mock_vector
			
			emit_signal("fired_projectile", pattern_parent.global_position, 
				projectile_info.velocity, pattern_collision,
				projectile_sprite_frame)

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.velocity_modifier

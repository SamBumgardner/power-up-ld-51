extends Node

signal fired_projectile

export(NodePath) var pattern_path
onready var pattern = get_node(pattern_path)
onready var pattern_duration = pattern.get("duration")
onready var pattern_position = pattern.get("position")
onready var pattern_collision = pattern.get("bullet_collision_mask")

export var projectile_sprite_frame = 0

var shoot_times: Array = [1]
var calc_vector: Vector2 = Vector2(1, 0)

func try_shoot(start_time, end_time):
	for shoot_time in shoot_times:
		if (start_time < shoot_time and end_time > shoot_time) \
				or (end_time > pattern_duration and fmod(end_time, pattern_duration)  > shoot_time):
			var projectile_info:ProjectileInfo = ProjectileInfo.new(shoot_time)
			
			populate_velocity(projectile_info)
			
			emit_signal("fired_projectile", pattern_position, 
				projectile_info.velocity, pattern_collision,
				projectile_sprite_frame)

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector.rotated(randf() * PI * 2)

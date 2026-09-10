extends CannonBase

## Cannon class to try firing one bullet right/East.
class_name CannonRight

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.RIGHT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

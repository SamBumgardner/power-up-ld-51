extends CannonBase

## Cannon class to try firing one bullet down/South.
class_name CannonDown

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.DOWN
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

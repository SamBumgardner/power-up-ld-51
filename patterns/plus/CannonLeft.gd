extends CannonBase

## Cannon class to try firing one bullet left/West.
class_name CannonLeft

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.LEFT
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

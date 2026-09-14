extends CannonBase

## Cannon class to try firing one bullet up/North.
class_name CannonUp

func populate_velocity(projectile_info:ProjectileInfo):
	calc_vector = Vector2.UP
	projectile_info.velocity = calc_vector * base_velocity * projectile_info.speed

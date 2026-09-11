extends PatternBase

## Pattern class to fire 5 bullets in random directions every second.
class_name PatternRandom

func get_cannons():
	var projectile_infos = [
		ProjectileInfo.new(1, 1),
		ProjectileInfo.new(1, 1),
		ProjectileInfo.new(1, 1),
		ProjectileInfo.new(1, 1),
		ProjectileInfo.new(1, 1),
	]
	return [
		CannonRandom.new(self, duration, bullet_collision_mask, projectile_infos)
	]

extends PatternBase

class_name PatternRandom

func _init(_bullet_collision_mask:int).(_bullet_collision_mask):
	pass

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

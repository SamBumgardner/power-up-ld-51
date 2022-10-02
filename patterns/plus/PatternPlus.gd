extends PatternBase

class_name PatternPlus

func _init(_bullet_collision_mask:int).(_bullet_collision_mask):
	duration = 5

func get_cannons():
	var projectile_infos = [
		ProjectileInfo.new(.5, .3), 
		ProjectileInfo.new(1, .3), 
		ProjectileInfo.new(1.5, .3)
	]
	return [
		CannonUp.new(self, duration, bullet_collision_mask, projectile_infos),
		CannonLeft.new(self, duration, bullet_collision_mask, projectile_infos),
		CannonRight.new(self, duration, bullet_collision_mask, projectile_infos),
		CannonDown.new(self, duration, bullet_collision_mask, projectile_infos),
	]

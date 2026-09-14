extends PatternBase

## Pattern class to fire 4 very slow bullets in a plus shape every 0.5
##  seconds 3 times in a row, then pause firing for 3.5 seconds.
class_name PatternPlus

func _init(_bullet_collision_mask:int):
	super(_bullet_collision_mask)
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

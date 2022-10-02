extends PatternBase

class_name PatternRandom

func _init(_bullet_collision_mask:int = 0).(_bullet_collision_mask):
	pass

func get_cannons():
	return [
		CannonRandom.new(self, duration, bullet_collision_mask)
	]

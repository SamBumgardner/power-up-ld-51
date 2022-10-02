extends PatternBase

func get_cannons():
	return [
		CannonRandom.new(duration, position, bullet_collision_mask)
	]

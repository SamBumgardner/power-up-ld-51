extends PatternBase

class_name PatternTargeted

var targetNode:Node2D

func _init(_bullet_collision_mask:int, _targetNode:Node2D).(_bullet_collision_mask):
	targetNode = _targetNode

func get_cannons():
	var projectile_infos = [
		ProjectileInfo.new(1, .5),
	]
	return [
		CannonTargeted.new(self, duration, bullet_collision_mask, projectile_infos, targetNode)
	]

extends Node2D

class_name Turret

const BLUE = Color(.5, .5, 1, 1)
const ORANGE = Color(1, .5, .6, 1)

func init(_pattern:PatternBase, _position:Vector2):
	add_child(_pattern)
	position = _position

	if (_pattern.bullet_collision_mask % 2 == 0):
		$AnimatedSprite.modulate = BLUE
	else:
		$AnimatedSprite.modulate = ORANGE

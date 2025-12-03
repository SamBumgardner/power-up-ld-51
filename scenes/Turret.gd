extends Node2D

class_name Turret

const BLUE = Color(.5, .5, 1, 1)
const ORANGE = Color(1, .5, .6, 1)

func init(_pattern:PatternBase, _position:Vector2):
	print('DEBUG21 _pattern:', _pattern, '_position:', _position)
	add_child(_pattern)
	position = _position

	print('DEBUG22 _pattern.bullet_collision_mask:', _pattern.bullet_collision_mask)
	if (_pattern.bullet_collision_mask % 2 == 0):
		$AnimatedSprite2D.modulate = BLUE
	else:
		$AnimatedSprite2D.modulate = ORANGE

extends Node2D

## Class to define a stationary turret aligned to 1 player that shoots
##  bullets in a pattern.
##
## Turrents and their bullets match the color of the player who placed
##  the turret. [br]
##
## [b]Colors by player are:[/b] [br]
##
## - Player 1 is [constant BLUE]. [br]
## - Player 2 is [constant ORANGE]. [br]
class_name Turret

const BLUE = Color(.5, .5, 1, 1)
const ORANGE = Color(1, .5, .6, 1)

func init(_pattern:PatternBase, _position:Vector2):
	add_child(_pattern)
	position = _position

	if (_pattern.bullet_collision_mask % 2 == 0):
		$AnimatedSprite2D.modulate = BLUE
	else:
		$AnimatedSprite2D.modulate = ORANGE

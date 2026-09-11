extends Node2D

class_name Turret

func init(_pattern:Node, _position:Vector2):
	add_child(_pattern)
	position = _position

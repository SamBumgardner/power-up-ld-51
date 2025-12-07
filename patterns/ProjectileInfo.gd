extends RefCounted

## Class to define when to shoot a projectile and at what constant
##  speed.
class_name ProjectileInfo

var shoot_time:float
var speed:float
var velocity:Vector2

func _init(_shoot_time, _speed):
	shoot_time = _shoot_time
	speed = _speed

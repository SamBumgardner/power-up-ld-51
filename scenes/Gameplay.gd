extends Node

class_name Gameplay

var projectile_pool = preload("res://ProjectilePool.gd").new()

func _ready():
	projectile_pool.init(self)
	

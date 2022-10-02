extends Node

var projectile_pool


func _ready():
	projectile_pool = preload("res://ProjectilePool.gd").new()
	projectile_pool.init(self)
	
	$Player1.connect("fired_projectile", projectile_pool, "_on_fired_projectile")
	$Player2.connect("fired_projectile", projectile_pool, "_on_fired_projectile")

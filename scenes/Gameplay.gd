extends Node

class_name Gameplay

var projectile_pool = preload("res://ProjectilePool.gd").new()
var turret_generator = preload("res://TurretGenerator.gd").new()

func _ready():
	projectile_pool.init(self)
	turret_generator.init(self)
	
	$Player1.connect("create_turret", turret_generator, "_on_create_turret")
	$Player2.connect("create_turret", turret_generator, "_on_create_turret")
	

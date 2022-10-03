extends Node

class_name Gameplay

var projectile_pool = preload("res://ProjectilePool.gd").new()
var turret_generator = preload("res://TurretGenerator.gd").new()

func _ready():
	projectile_pool.init(self)
	turret_generator.init(self)
	
	$Player1.connect("create_turret", turret_generator, "_on_create_turret")
	$Player2.connect("create_turret", turret_generator, "_on_create_turret")
	$Player1.connect("kill", self, "_on_kill")
	$Player2.connect("kill", self, "_on_kill")
	
func _on_kill(player_number:int):
	print_debug("game is over, player " + str(player_number) + " was defeated")
	#TODO: Implement game over logic here.

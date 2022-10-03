extends Node

class_name Gameplay

var projectile_pool = preload("res://ProjectilePool.gd").new()
var turret_generator = preload("res://TurretGenerator.gd").new()

var secret_score:int = 0

func _ready():
	projectile_pool.init(self)
	turret_generator.init(self)
	
	$SecretScore.hide()
	
	$Player1.connect("create_turret", turret_generator, "_on_create_turret")
	$Player2.connect("create_turret", turret_generator, "_on_create_turret")
	$Player1.connect("kill", self, "_on_kill")
	$Player2.connect("kill", self, "_on_kill")
	$Player1.connect("upgrade_consumed", self, "_on_upgrade_consumed")
	$Player2.connect("upgrade_consumed", self, "_on_upgrade_consumed")
	
	
func _on_kill(player_number:int):
	print_debug("game is over, player " + str(player_number) + " was defeated")
	#TODO: Implement game over logic here.

func _on_upgrade_consumed():
	secret_score += 1
	$SecretScore.text = str(secret_score)
	if secret_score > 20:
		$SecretScore.show()

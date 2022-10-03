extends Node

class_name Gameplay

var projectile_pool = preload("res://ProjectilePool.gd").new()
var turret_generator = preload("res://TurretGenerator.gd").new()

var secret_score:int = 0

func _ready():
	projectile_pool.init(self)
	turret_generator.init(self)

	$Announcement.text = ""

	$SecretScore.hide()
	$Announcement.hide()

	$Player1.connect("create_turret", turret_generator, "_on_create_turret")
	$Player2.connect("create_turret", turret_generator, "_on_create_turret")
	$Player1.connect("kill", self, "_on_kill")
	$Player2.connect("kill", self, "_on_kill")
	$Player1.connect("upgrade_consumed", self, "_on_upgrade_consumed")
	$Player2.connect("upgrade_consumed", self, "_on_upgrade_consumed")

func _on_kill(player_number:int):
	_game_over(player_number)

func _on_upgrade_consumed():
	secret_score += 1
	$SecretScore.text = str(secret_score)
	if secret_score > 20:
		$SecretScore.show()

#############
# GAME OVER #
#############
func _game_over(player_number_lost:int):
	print_debug("game is over, player " + str(player_number_lost) + " was defeated")
	if !$Announcement.visible:
		get_tree().paused = true
		$GameOverToResetDelay.start()
		$Announcement.text = _get_game_over_text(player_number_lost)
		$Announcement.show()

func _get_game_over_text(player_number_lost:int):
	# Get remaining player number out of 2 players.
	var player_number_won = 1
	if player_number_lost == 1:
		player_number_won = 2

	return "Player " + str(player_number_won) + " Wins!"


func _on_GameOverToResetDelay_timeout():
	# Show prompt to restart game.
	var textToAppend = ""

	if $Announcement.text != "":
		textToAppend = "\n"

	textToAppend += "Press Any Key to Restart"

	$Announcement.text += textToAppend
	$Announcement.show()

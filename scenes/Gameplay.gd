extends Node

## Class to manage starting, ending, and restarting gameplay.
class_name Gameplay

@onready var announcement_label = $HUD/MarginContainer/HBoxContainer/VBoxContainer/Announcement as Label
@onready var secret_score_label = $HUD/MarginContainer/HBoxContainer/VBoxContainer/SecretScore as Label

var projectile_pool:ProjectilePool = preload("res://ProjectilePool.gd").new()
var turret_generator:TurretGenerator = preload("res://TurretGenerator.gd").new()

var secret_score:int = 0

func _ready():
	projectile_pool.init(self)
	turret_generator.init(self)

	announcement_label.text = ""

	secret_score_label.hide()
	announcement_label.hide()

	$Player1.connect("create_turret", Callable(turret_generator, "_on_create_turret"))
	$Player2.connect("create_turret", Callable(turret_generator, "_on_create_turret"))
	$Player1.connect("kill", Callable(self, "_on_kill"))
	$Player2.connect("kill", Callable(self, "_on_kill"))
	$Player1.connect("upgrade_consumed", Callable(self, "_on_upgrade_consumed"))
	$Player2.connect("upgrade_consumed", Callable(self, "_on_upgrade_consumed"))

func _on_kill(player_number:int):
	_game_over(player_number)

func _on_upgrade_consumed():
	secret_score += 1
	secret_score_label.text = str(secret_score)
	if secret_score > 20:
		secret_score_label.show()

#############
# GAME OVER #
#############
func _game_over(player_number_lost:int):
	print_debug("game is over, player " + str(player_number_lost) + " was defeated")
	if !announcement_label.visible:
		get_tree().paused = true
		$GameOverToResetDelay.start()
		announcement_label.text = _get_game_over_text(player_number_lost)
		announcement_label.show()

func _get_game_over_text(player_number_lost:int):
	# Get remaining player number out of 2 players.
	var player_number_won = 1
	if player_number_lost == 1:
		player_number_won = 2

	return "Player " + str(player_number_won) + " Wins!"


func _on_GameOverToResetDelay_timeout():
	# Show prompt to restart game.
	var textToAppend = ""

	if announcement_label.text != "":
		textToAppend = "\n"

	textToAppend += "Press Any Key to Restart"

	announcement_label.text += textToAppend
	announcement_label.show()

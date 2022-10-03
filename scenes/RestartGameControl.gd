extends Node

var allow_reset_game = false

func _input(event):
	# Press any key to restart game after lingering on the Game Over screen.
	if allow_reset_game && event is InputEventKey:
		get_tree().paused = false
		allow_reset_game = false

func _on_GameOverToResetDelay_timeout():
	allow_reset_game = true

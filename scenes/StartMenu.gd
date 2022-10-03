extends Control

var _first_opened = true

func _ready():
	_first_opened = true
	$ButtonsContainer/StartButton.grab_focus()

func _on_QuitButton_focus_entered():
	$AudioStreamPlayer.play()

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartButton_focus_entered():
	if _first_opened:
		_first_opened = false
	else:
		$AudioStreamPlayer.play()

func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Gameplay.tscn")

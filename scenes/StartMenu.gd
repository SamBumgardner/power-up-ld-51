extends Control

var _first_opened = true

func _ready():
	_first_opened = true
	$ButtonsContainer/StartButton.grab_focus()

func _on_QuitButton_focus_entered():
	$SFX_Blip_Focus.play()

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartButton_focus_entered():
	if _first_opened:
		_first_opened = false
	else:
		$SFX_Blip_Focus.play()

func _on_StartButton_pressed():
	$SFX_Blip_Select.play()
	get_tree().change_scene("res://scenes/Gameplay.tscn")

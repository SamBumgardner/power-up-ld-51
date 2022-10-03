extends AudioStreamPlayer

# Play music in order:
#  * AudioStreamPlayer
#  * AudioStreamPlayer2
# Then loop last song until game over.

func _ready():
	$AudioStreamPlayer.play()

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer2.play()

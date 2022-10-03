extends ProgressBar

onready var timer = $UpgradeTimer as Timer

func _process(_delta):
	value = (timer.wait_time - timer.time_left) / timer.wait_time * 100

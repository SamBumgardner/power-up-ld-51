extends Node2D

onready var timer = $UpgradeTimer as Timer
onready var left_half = $LeftHalf as ProgressBar
onready var right_half = $RightHalf as ProgressBar

func _process(_delta):
	set_progress(left_half)
	set_progress(right_half)

func set_progress(bar:ProgressBar):
	bar.value = (timer.wait_time - timer.time_left) / timer.wait_time * 100

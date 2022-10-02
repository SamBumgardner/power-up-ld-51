extends Node2D

class_name PatternBase

export var duration = 1.0
var total_elapsed = 0
var bullet_collision_mask = 0b0000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	total_elapsed += delta
	
	if total_elapsed >= duration:
		total_elapsed - duration

extends RefCounted

class_name TurretGenerator

var parent_node:Gameplay
var turret_template:PackedScene

func init(parent):
	parent_node = parent
	turret_template = preload("res://scenes/Turret.tscn")

func _on_create_turret(pattern_node, position):
	var turret:Turret = turret_template.instantiate() as Turret
	turret.init(pattern_node, position)
	parent_node.add_child(turret)

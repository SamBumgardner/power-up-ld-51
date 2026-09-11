extends Reference

class_name TurretGenerator

var parent_node
var turret_template

func init(parent):
	parent_node = parent
	turret_template = preload("res://scenes/Turret.tscn")

func _on_create_turret(pattern_node, position):
	var turret:Turret = turret_template.instance() as Turret
	turret.init(pattern_node, position)
	parent_node.add_child(turret)

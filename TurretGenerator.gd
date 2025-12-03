extends RefCounted

class_name TurretGenerator

var parent_node:Gameplay
var turret_template:PackedScene

func init(parent):
	parent_node = parent
	turret_template = preload("res://scenes/Turret.tscn")

func _on_create_turret(pattern_node, position):
	print('DEBUG01 pattern_node:', pattern_node, 'position:', position)
	var turret:Turret = turret_template.instantiate() as Turret
	print('DEBUG02 turret:', turret)
	turret.init(pattern_node, position)
	print('DEBUG03 turret:', turret)
	parent_node.add_child(turret)
	# Error on `parent_node.children()`.
	# print('DEBUG04 parent_node:', parent_node, 'parent_node.children():', parent_node.children())

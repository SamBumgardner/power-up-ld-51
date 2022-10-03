extends Reference

class_name ProjectilePool

var parent_node:Node
var projectile_node:Node
var projectiles

func init(parent:Node):
	parent_node = parent
	projectile_node = parent_node.find_node("Projectiles")
	projectiles = preload("res://scenes/Bullet.tscn")

func _on_fired_projectile(position, velocity, collision_mask, sprite_frame):
	var projectile = projectiles.instance()
	projectile.init(position, velocity, collision_mask, sprite_frame)
	parent_node.add_child_below_node(projectile_node, projectile)

extends RefCounted

## Defines a pool of projectiles to enhance game performance of
##  bullets.
class_name ProjectilePool

var parent_node:Node
var projectile_node:Node
var projectiles

func init(parent:Node):
	parent_node = parent
	projectile_node = parent_node.find_child("Projectiles")
	projectiles = preload("res://scenes/Bullet.tscn")

func _on_fired_projectile(position, velocity, collision_mask, sprite_frame):
	var projectile = projectiles.instantiate()
	projectile.init(position, velocity, collision_mask, sprite_frame)
	projectile_node.add_sibling(projectile)

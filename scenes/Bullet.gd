extends Area2D

var screen_size
var velocity = Vector2();

func _ready():
	screen_size = get_viewport_rect().size

func init(spawn_position, spawn_velocity, spawn_collision_mask, sprite_frame):
	position = spawn_position
	velocity = spawn_velocity
	collision_layer = 0
	collision_mask = spawn_collision_mask
	$AnimatedSprite.frame = sprite_frame
	#connect("body_entered", self, "_on_Bullet_body_entered")


func _physics_process(delta):
	position += velocity * delta
	if isOutOfBounds():
		kill()

func isOutOfBounds():
	if position.x < 0 or position.x > screen_size.x or position.y < 0 or position.y > screen_size.y:
		return true
	else:
		return false

func _on_Bullet_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
	kill()

func kill():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	set_process(false)
	queue_free() #Change to object pooling for efficiency if needed.

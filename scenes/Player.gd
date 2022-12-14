extends Area2D

class_name Player

signal hit
signal kill
signal create_turret
signal upgrade_consumed
signal upgrades_changed

export var speed = 125
export var max_health = 5
onready var health = max_health
export var player_number = 1
export(NodePath) var target_player_path

onready var target_player = get_node(target_player_path)
onready var target_player_collision = target_player.get("collision_layer") 

const BLUE = Color(.5, .5, 1, 1)
const ORANGE = Color(1, .7, .6, 1)

var default_tint = Color(1,1,1,1)
const HURT_TINT = Color(.5,.5,.5,.5)
const RECOVERY_DURATION = 2

var player_prefix
var velocity
var screen_size
var radius
var max_x
var max_y

var pattern_targeted = preload("res://patterns/targeted/PatternTargeted.gd")
var pattern_random = preload("res://patterns/random/PatternRandom.gd")
var pattern_plus = preload("res://patterns/plus/PatternPlus.gd")
var patterns:Array = [pattern_targeted, pattern_random, pattern_plus]
var upgrades:Array = []

const upgrade_refill = 2
var next_upgrades:Array = [randi() % patterns.size(), randi() % patterns.size()]

func _ready():
	player_prefix = "p" + str(player_number) + "_"
	velocity = Vector2.ZERO
	screen_size = get_viewport_rect().size
	radius = ($CollisionShape2D.shape as CircleShape2D).radius
	max_x = screen_size.x - radius
	max_y = screen_size.y - radius
	
	if player_number == 1:
		default_tint = BLUE
	else:
		default_tint = ORANGE
	
	$AnimatedSprite.modulate = default_tint
	pass


func _process(_delta):
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	if Input.is_action_just_pressed(player_prefix + "upgrade") && !next_upgrades.empty():
		assign_upgrade()
	
	if Input.is_action_just_pressed(player_prefix + "turret") && !next_upgrades.empty():
		create_turret()

func consume_next_pattern():
	var pattern
	var next_upgrade_index = next_upgrades.pop_back()
	
	if next_upgrade_index == 0:
		pattern = patterns[next_upgrade_index].new(target_player_collision, target_player)
	else:
		pattern = patterns[next_upgrade_index].new(target_player_collision)
	
	emit_signal("upgrade_consumed")
	emit_signal("upgrades_changed", next_upgrades)
	return pattern

func assign_upgrade():
	_play_SFX_Assign_Upgrade()
	var upgrade = consume_next_pattern()
	upgrades.append(upgrade)
	add_child(upgrade)

func create_turret():
	emit_signal("create_turret", consume_next_pattern(), position)
	_play_SFX_Create_Turret()
	
func _on_Upgrade_timeout():
	next_upgrades.clear() 
	for _i in range(upgrade_refill):
		next_upgrades.push_back(randi() % patterns.size())
	
	emit_signal("upgrades_changed", next_upgrades)

func _physics_process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed(player_prefix + "move_right"):
		velocity.x += 1
	if Input.is_action_pressed(player_prefix + "move_left"):
		velocity.x -= 1
	if Input.is_action_pressed(player_prefix + "move_down"):
		velocity.y += 1
	if Input.is_action_pressed(player_prefix + "move_up"):
		velocity.y -= 1
	
	position += velocity * speed * delta;
	position.x = clamp(position.x, radius + 14, max_x - 14)
	position.y = clamp(position.y, radius + 15, max_y)

########
# HURT #
########
func _on_Player_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
	if $Recovery.is_stopped():
		health -= 1
	if health > 0:
		emit_signal("hit")
		_play_SFX_Hurt()
		hit()
	else:
		_play_SFX_Killed()
		kill()

func hit():
	$Recovery.start(RECOVERY_DURATION)
	$AnimatedSprite.modulate = HURT_TINT
	$CollisionShape2D.set_deferred("disabled", true)

func kill():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	set_process(false)
	set_physics_process(false)
	for upgrade in upgrades:
		upgrade.set_process(false)
		upgrade.set_physics_process(false)
	emit_signal("kill", player_number)

func _on_Recovery_timeout():
	$AnimatedSprite.modulate = default_tint
	$CollisionShape2D.set_deferred("disabled", false)

###############
# SFX Signals #
###############
func _play_SFX_Assign_Upgrade():
	$SFX_Assign_Upgrade.play()

func _play_SFX_Create_Turret():
	$SFX_Create_Turret.play()

func _play_SFX_Hurt():
	if player_number == 1:
		$SFX_Explosion_Middle.play()
	else:
		$SFX_Explosion_High.play()

func _play_SFX_Killed():
	$SFX_Explosion_Long.play()

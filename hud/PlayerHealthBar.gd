extends ProgressBar

const BLUE = Color(0, 25, 175, 200)
const ORANGE = Color(225, 50, 0, 200)

@export var player_path: NodePath
@onready var player:Player = get_node(player_path) as Player

func _ready():
	max_value = player.max_health
	_set_player_health_current()
	player.health_changed.connect(_on_player_health_changed)
	#if player.player_number == 1:
		#self_modulate = BLUE
	#else:
	#	self_modulate = ORANGE

func _on_player_health_changed(remaining_health: int) -> void:
	_set_player_health_current()

func _set_player_health_current():
	value = player.health

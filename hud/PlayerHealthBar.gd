extends ProgressBar

const BLUE = Color(0, 25, 175, 200)
const ORANGE = Color(225, 50, 0, 200)

@export var player_path: NodePath
@onready var player:Player = get_node(player_path) as Player

func _ready():
	max_value = player.max_health
	_set_player_health_current()
	player.health_changed.connect(_on_player_health_changed)

func _on_player_health_changed(_remaining_health: int) -> void:
	_set_player_health_current()

func _set_player_health_current() -> void:
	value = player.health

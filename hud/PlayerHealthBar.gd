extends ProgressBar

const BLUE = Color(0, 25, 175, 200)
const ORANGE = Color(225, 50, 0, 200)

@export var player_path: NodePath
@onready var player:Player = get_node(player_path) as Player

func _ready():
	max_value = player.max_health
	value = player.health / 2
	#value = 0
	player.health_changed.connect(_on_player_health_changed)
	if player.player_number == 1:
		self_modulate = BLUE
	#else:
	#	self_modulate = ORANGE

func _on_player_health_changed(remaining_health: int) -> void:
	value = remaining_health


func _on_player_1_health_changed(remaining_health: int) -> void:
	value = remaining_health

#func _process(_delta):
#	value = 0

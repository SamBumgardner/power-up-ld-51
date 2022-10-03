extends ProgressBar

const BLUE = Color(0, 25, 175, 200)
const ORANGE = Color(225, 50, 0, 200)

export(NodePath) var player_path
onready var player:Player = get_node(player_path) as Player

func _ready():
	max_value = player.max_health
	if player.player_number == 1:
		self_modulate = BLUE
	else:
		self_modulate = ORANGE

func _process(_delta):
	value = player.health

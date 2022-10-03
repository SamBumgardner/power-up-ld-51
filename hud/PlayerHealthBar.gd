extends ProgressBar

export(NodePath) var player_path
onready var player:Player = get_node(player_path) as Player

func _process(_delta):
	value = player.health

extends TextureRect

export var player_number:int
export(NodePath) var parent_path
onready var event_publisher_path = "../" + str(get_node(parent_path).get("p" + str(player_number) + "_path"))
onready var event_publisher:Player = get_node(event_publisher_path)

onready var sprites:Array = [$SecondUpgrade, $FirstUpgrade]

func _ready():
	event_publisher.connect("upgrades_changed", self, "_on_upgrades_changed")
	_on_upgrades_changed(event_publisher.next_upgrades)

func _on_upgrades_changed(upgrades):
	for i in range(2):
		var sprite = sprites[i] as AnimatedSprite
		if sprites.size() - i > upgrades.size():
			sprite.hide()
		else:
			sprite.show()
			sprite.frame = upgrades[-i]

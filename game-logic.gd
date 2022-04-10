extends Node

var card_scene = load("res://cards/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("game_scene._ready")
	
	var card_count = 5
	
	for i in range(card_count):
		var card = card_scene.instance()
		card.transform = card_transform(i, card_count)
		self.add_child(card)

const CARD_SPACING = 1.2
const CARD_SCALE = 3

func card_transform(index: int, total_card_count: int) -> Transform:
	# 0..10 -> -5..5
	var index_adj: float = float(index) - float(total_card_count) / 2.0 + 0.5
	
	return Transform(Basis(Vector3(0, 0, 0))) \
			.scaled(Vector3(CARD_SCALE, CARD_SCALE, CARD_SCALE)) \
			.rotated(Vector3(0, 1, 0).normalized(), index_adj / -15.0) \
			.translated(Vector3(index_adj * CARD_SPACING, index_adj / 100.0, 0)) \

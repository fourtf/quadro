extends Spatial

class_name Card

enum CardColor { Red, Blue, Green, Yellow, Colorless }

var card_materials_by_color = {
	CardColor.Red: load("res://images/card_red.png"),
	CardColor.Blue: load("res://images/card_blue.png"),
	CardColor.Green: load("res://images/card_green.png"),
	CardColor.Yellow: load("res://images/card_yellow.png"),
	CardColor.Colorless: load("res://images/card_black.png"),
}

# Color of the card
export(CardColor) var color = CardColor.Colorless; var color_

func _process(delta):
	if color_ != color:
		color_ = color
		$MeshInstance.material_override = card_materials_by_color[color]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

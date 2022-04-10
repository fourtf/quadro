extends Spatial

class_name Card

enum CardColor { Red, Blue, Green, Yellow, Colorless }

var card_texture_by_color = {
	CardColor.Red: load("res://images/card_red.png"),
	CardColor.Blue: load("res://images/card_blue.png"),
	CardColor.Green: load("res://images/card_green.png"),
	CardColor.Yellow: load("res://images/card_yellow.png"),
	CardColor.Colorless: load("res://images/card_black.png"),
}

# Color of the card
export(CardColor) var color = CardColor.Colorless; var color_

# show collisions for debugging
#func _ready():
#	get_tree().set_debug_collisions_hint(true) 

func _process(delta):
	if color_ != color:
		color_ = color
		$MeshInstance.get_surface_material(0).albedo_texture = card_texture_by_color[color]

func _on_StaticBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and !event.pressed:
		print("card clicked")


func _on_StaticBody_mouse_entered():
	print("card entered")


func _on_StaticBody_mouse_exited():
	print("card exited")

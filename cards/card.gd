extends Spatial
class_name Card

var util = preload("res://util.gd")

enum CardColor { Red, Blue, Green, Yellow, Colorless }

var card_texture_by_color = {
	CardColor.Red: load("res://images/card_red.png"),
	CardColor.Blue: load("res://images/card_blue.png"),
	CardColor.Green: load("res://images/card_green.png"),
	CardColor.Yellow: load("res://images/card_yellow.png"),
	CardColor.Colorless: load("res://images/card_black.png"),
}

enum CardValue { _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, Draw2, Draw4 }

# Color of the card
export(CardColor) var color = CardColor.Colorless; var color_
export(CardValue) var value = CardValue._0; var value_

func _ready():
#	get_tree().set_debug_collisions_hint(true)
	
	$MeshInstance.material_override = SpatialMaterial.new()
	
	var ct = SpatialMaterial.new()
	ct.flags_transparent = true
	$CardText.material_override = ct

func _process(delta):
	if color_ != color or value_ != value:
		color_ = color
		value_ = value
		$MeshInstance.material_override.albedo_texture = card_texture_by_color[color]
		print(_get_card_text_image())
		$CardText.material_override.albedo_texture = _get_card_text_image()

func _on_StaticBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and !event.pressed:
		print("card clicked", color, value)

func _on_StaticBody_mouse_entered():
	print("card entered")

func _on_StaticBody_mouse_exited():
	print("card exited")

func set_random():
	self.value = util.pick_random(CardValue.values())
	self.color = util.pick_random(CardColor.values().slice(0, 3))

func _get_card_text_image():
	var c = String(CardColor.keys()[color_]).to_lower()
	var v = String(CardValue.keys()[value]).replace("_", "")
	var path = "images/%s_%s.png" % [c, v]
	print(path)
	
	return load(path)

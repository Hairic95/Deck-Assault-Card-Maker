extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_color(color):
	$CardName.add_color_override("font_color", color)
	$CardCost.add_color_override("font_color", color)
	$CardType.add_color_override("font_color", color)
	$CardText.add_color_override("font_color", color)
	$CardStats.add_color_override("font_color", color)

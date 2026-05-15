extends Polygon2D
class_name Jigsaw


@export var want_color:Color = Color.WHITE

func _ready() -> void:
	hide()

func paint(brush_color:Color) -> void:
	color = brush_color
	show()

extends Line2D
class_name Jigsaw


@export var want_color:Color = Color.WHITE

var polygon:Polygon2D = null

func _ready() -> void:
	closed = true
	default_color = Color(0.3,0.3,0.3)
	width = 10.0
	joint_mode = Line2D.LINE_JOINT_ROUND
	polygon = Polygon2D.new()
	polygon.polygon = points
	polygon.antialiased = true
	add_child(polygon)
	print(polygon)
	polygon.hide()

func paint(brush_color:Color) -> void:
	polygon.color = brush_color
	polygon.show()

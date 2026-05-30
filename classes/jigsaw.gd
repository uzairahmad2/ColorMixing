extends Node2D
class_name Jigsaw


@export var want_color:Color = Color.WHITE

@export var texture:Texture = null
var polygon:Polygon2D = null

func _ready() -> void:
	for line:Line2D in get_children():
		line.closed=true
		line.default_color = Color(0.5,0.5,0.5)
		line.width = 1.0
		line.joint_mode = Line2D.LINE_JOINT_ROUND
		polygon = Polygon2D.new()
		polygon.texture = texture
		polygon.texture_scale = Vector2(4,4)
		polygon.texture_repeat = CanvasItem.TEXTURE_REPEAT_MIRROR
		polygon.polygon = line.points
		polygon.antialiased = true
		line.add_child(polygon)
		polygon.hide()

func paint(brush_color:Color) -> void:
	for line:Line2D in get_children():
		line.width = 0
		line.get_child(0).color = brush_color
		line.get_child(0).show()

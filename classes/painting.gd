extends Node2D
class_name Painting



var current_jigsaw:int = 0
var paint_target:PaintTarget = null

signal jigsaw_ready(Color)
signal painting_finished()


func get_current_jigsaw_color() -> Color:
	if current_jigsaw >= get_child_count() or not get_child(current_jigsaw) is Jigsaw:
		return Color.WHITE
	return get_child(current_jigsaw).want_color

func paint_jigsaw(color:Color) -> void:
	if current_jigsaw >= get_child_count() or not get_child(current_jigsaw) is Jigsaw:
		return
	
	get_child(current_jigsaw).paint(color)
	current_jigsaw += 1
	
	if current_jigsaw >= get_child_count() or not get_child(current_jigsaw) is Jigsaw:
		painting_finished.emit()
		return
	jigsaw_ready.emit(get_child(current_jigsaw).want_color)

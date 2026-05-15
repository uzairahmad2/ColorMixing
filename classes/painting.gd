extends Node2D
class_name Painting



var current_jigsaw:int = 0
var paint_target:PaintTarget = null

signal jigsaw_ready(Color)
signal painting_finished()


func _ready() -> void:
	if current_jigsaw >= get_child_count():
		return
	if not get_child(current_jigsaw) == Jigsaw:
		return
	jigsaw_ready.emit(get_child(current_jigsaw).want_color)

func paint_jigsaw(color:Color) -> void:
	if current_jigsaw >= get_child_count():
		return
	if not get_child(current_jigsaw) is Jigsaw:
		return
	
	get_child(current_jigsaw).paint(color)
	current_jigsaw += 1
	
	if current_jigsaw >= get_child_count():
		painting_finished.emit()
	elif get_child(current_jigsaw) is Jigsaw:
		jigsaw_ready.emit(get_child(current_jigsaw).want_color)

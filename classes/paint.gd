extends ColorRect
class_name Paint


var empty:bool = true


func _process(_delta:float) -> void:
	visible = !empty


func add(m_color:Color) -> void:
	if empty:
		color = m_color
		empty = false
	else:
		color += m_color


func clear() -> void:
	empty = true

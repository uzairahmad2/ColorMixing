extends ColorRect
class_name Paint

var Mixbox = preload("res://addons/mixbox/mixbox.gd")

var empty:bool = true


func _process(_delta:float) -> void:
	visible = !empty


func add(color2:Color, amount:float=0.07) -> void:
	if empty:
		color = color2
		empty = false
	else:
		color = Mixbox.lerp(color,color2,amount)


func clear() -> void:
	empty = true

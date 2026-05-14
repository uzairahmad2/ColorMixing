extends TextureButton
class_name Tube


@export var color:Color = Color.RED
@export var target:Paint = null


func _on_pressed() -> void:
	if target == null:
		return
	
	target.add(color)

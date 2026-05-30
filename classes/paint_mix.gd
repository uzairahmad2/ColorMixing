extends Sprite2D
class_name PaintMix

var Mixbox = preload("res://addons/mixbox/mixbox.gd")

var color:Color = Color.WHITE
var empty:bool = true

var blob_shine:Sprite2D = null


func _ready() -> void:
	centered = false
	hframes = 3
	vframes = 2
	texture = load("res://assets/paintmix.png")
	
	blob_shine = Sprite2D.new()
	blob_shine.centered = false
	blob_shine.hframes = 3
	blob_shine.vframes = 2
	add_child(blob_shine)
	blob_shine.texture = load("res://assets/paintmix_shine.png")


func _process(_delta:float) -> void:
	visible = !empty


func add(color2:Color, amount:float=0.1) -> void:
	var lottery:Array[int] = [0,1,2,3,4,5]
	lottery.erase(frame)
	frame = lottery.pick_random()
	blob_shine.frame = frame
	if empty:
		color = color2
		empty = false
	else:
		color = Mixbox.lerp(color,color2,amount)
	self_modulate = color


func clear() -> void:
	empty = true

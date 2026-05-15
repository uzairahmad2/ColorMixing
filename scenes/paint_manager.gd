extends Node2D


@export var painting:Painting = null

@onready var paint:Paint = $Paint
@onready var btn_paint:Button = $ButtonPaint
@onready var btn_clear:Button = $ButtonClear
@onready var paint_target:PaintTarget = $PaintTarget

var waited_one_frame:bool = false

func _ready() -> void:
	btn_paint.connect("pressed", submit_paint)
	btn_clear.connect("pressed", paint.clear)
	if painting != null:
		painting.jigsaw_ready.connect(jigsaw_ready)
		painting.painting_finished.connect(painting_finished)

func submit_paint() -> void:
	if painting == null:
		return
	if not paint.visible:
		return
	painting.paint_jigsaw(paint.color)


func jigsaw_ready(want_color:Color) -> void:
	print("Jig")
	paint_target.color = want_color
	paint.clear()

func painting_finished() -> void:
	pass

extends Node2D


@export var painting:Painting = null

@onready var paint_mix:PaintMix = $PaintMix
@onready var btn_paint:Button = $ButtonPaint
@onready var btn_clear:Button = $ButtonClear
@onready var paint_target:PaintTarget = $PaintTarget

var waited_one_frame:bool = false

func _ready() -> void:
	btn_paint.connect("pressed", submit_paint)
	btn_clear.connect("pressed", paint_mix.clear)
	if painting != null:
		painting.jigsaw_ready.connect(jigsaw_ready)
		painting.painting_finished.connect(painting_finished)
	
	paint_target.color = painting.get_current_jigsaw_color()
	paint_mix.clear()

func submit_paint() -> void:
	if painting == null:
		return
	if paint_mix.empty:
		return
	painting.paint_jigsaw(paint_mix.color)


func jigsaw_ready(want_color:Color) -> void:
	paint_target.color = want_color
	paint_mix.clear()

func painting_finished() -> void:
	pass

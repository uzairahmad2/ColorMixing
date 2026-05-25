extends Node

var Mixbox = preload("res://addons/mixbox/mixbox.gd")

var base_colors:Array[Color] = [
	Color(1,0,0),
	Color(1,1,0),
	Color(0,0,1),
	Color(0,1,0),
	Color(0,1,1),
	Color(1,0,1)
]

var data:Array = []

func _ready() -> void:
	for i in range(base_colors.size()):
		for j in range(base_colors.size()):
			if j <= i:
				continue
			data.append([
				i,
				j,
				Mixbox.lerp(base_colors[i],base_colors[j],0.5)
			])

func c2vec(c:Color) -> Vector3:
	return Vector3(c.r,c.g,c.b)

func get_nearest(c:Color) -> int:
	var dist:float = c2vec(c).distance_to(c2vec(base_colors[0]))
	var out:int = 0
	for i in range(1,base_colors.size()):
		if c2vec(c).distance_to(c2vec(base_colors[i])) < dist:
			out = i
	return out

func pigmint_lerp(c1:Color, c2:Color, weight:float=0.5) -> Color:
	if c1 == c2:
		return c1
	
	# n = nearest
	var n1:int = get_nearest(c1)
	var n2:int = get_nearest(c2)
	var n1_dist:float = c2vec(c1).distance_to(c2vec(base_colors[n1]))
	var n2_dist:float = c2vec(c2).distance_to(c2vec(base_colors[n2]))
	
	## search nearest mixdata
	for i in range(data.size()):
		if data[i][0] != n1 and data[i][1] != n1:
			continue
		if data[i][0] != n2 and data[i][1] != n2:
			continue
	
	return Color.WHITE

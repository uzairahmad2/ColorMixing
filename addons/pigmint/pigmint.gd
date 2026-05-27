extends Node
class_name Pigmint



static func pigmint_lerp(c1:Color, c2:Color, weight:float=0.5) -> Color:
	if c1 == c2:
		return c1
	
	# My linear approach
	#return Color.WHITE - (Color.WHITE-c1)*(1.0-weight) - (Color.WHITE-c2)*weight
	
	# ChatGPT:
	return Color(
		pow(c1.r,1.0-weight) * pow(c2.r,weight),
		pow(c1.g,1.0-weight) * pow(c2.g,weight),
		pow(c1.b,1.0-weight) * pow(c2.b,weight)
	)
	

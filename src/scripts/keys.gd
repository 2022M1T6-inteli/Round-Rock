extends Node2D

func _process(delta):
	if get_parent().get_parent().position.x >= 300:
		visible = false

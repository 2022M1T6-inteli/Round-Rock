extends Area2D

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		
		if not get_parent().clicked and not GlobalDeckBuilder.oneCardOnly:
			get_parent().clicked = true
			GlobalDeckBuilder.oneCardOnly = true
			get_parent().buttons()
			
		elif get_parent().clicked and GlobalDeckBuilder.oneCardOnly:
			get_parent().clicked = false
			GlobalDeckBuilder.oneCardOnly = false
			get_parent().buttons()

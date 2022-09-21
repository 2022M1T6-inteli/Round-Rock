extends Area2D

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		
		if not get_parent().clicked and not GlobalCards.oneCardOnly:
			get_parent().clicked = true
			GlobalCards.oneCardOnly = true
			get_parent().buttons()
			
		elif get_parent().clicked and GlobalCards.oneCardOnly:
			get_parent().clicked = false
			GlobalCards.oneCardOnly = false
			get_parent().buttons()

extends TextureButton


func _process(delta):
	# If the button is pressed, the corresponding dimension is recorded in a global variable and the scene is changed
	if pressed:
		GlobalDeckBuilder.dimension = "Quality KPIs"
		get_tree().change_scene("res://DeckBuilder/Scenes/Info.tscn")
		GlobalDeckBuilder.goToInfo = true

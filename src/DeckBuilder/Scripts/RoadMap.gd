extends TextureButton


func _process(delta):
	if pressed:
		# If the button is pressed, the corresponding dimension is recorded in a global variable and the scene is changed
		GlobalDeckBuilder.dimension = "Roadmap"
		get_tree().change_scene("res://DeckBuilder/Scenes/Info.tscn")
		GlobalDeckBuilder.goToInfo = true

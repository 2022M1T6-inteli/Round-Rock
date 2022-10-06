extends TextureButton





func _on_ReturnButton_pressed():
	# Return to the dimensions scene from the card scene
	get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")
	GlobalDeckBuilder.oneCardOnly = false
	GlobalDeckBuilder.returnToDimensions = true

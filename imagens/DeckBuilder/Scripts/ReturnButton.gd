extends TextureButton





func _on_ReturnButton_pressed():
	get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")
	GlobalDeckBuilder.returnToDimensions = true

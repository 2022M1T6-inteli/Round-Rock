extends TextureButton



# Button to return to the map scene
func _on_DimensionsReturnButton_pressed():
	#GlobalDeckBuilder.clearDimensions = true
	get_tree().change_scene(GlobalDeckBuilder.sceneToReturnTo)

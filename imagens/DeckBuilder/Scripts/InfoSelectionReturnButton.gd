extends TextureButton


func _process(delta):
	if pressed:
		# Takes you back to the dimension scene
		GlobalDeckBuilder.returnToDimensions = true
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")

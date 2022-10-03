extends TextureButton


func _process(delta):
	if pressed:
		GlobalDeckBuilder.returnToDimensions = true
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")

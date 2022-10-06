extends TextureButton


func _process(delta):
	if pressed:
		GlobalDeckBuilder.sceneToReturnTo = get_parent().get_parent().get_parent().get_filename()
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")

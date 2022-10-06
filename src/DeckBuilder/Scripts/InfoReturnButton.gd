extends TextureButton


func _process(delta):
	if pressed:
		# Takes you back to the information selection scene
		GlobalDeckBuilder.goToInfoSelection = true
		get_tree().change_scene("res://DeckBuilder/Scenes/InfoSelection.tscn")

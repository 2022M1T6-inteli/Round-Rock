extends TextureButton


func _process(delta):
	# Takes you to the information selection scene
	if pressed:
		get_tree().change_scene("res://DeckBuilder/Scenes/InfoSelection.tscn")
		GlobalDeckBuilder.goToInfoSelection = true

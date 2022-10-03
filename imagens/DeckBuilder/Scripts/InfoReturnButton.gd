extends TextureButton


func _process(delta):
	if pressed:
		GlobalDeckBuilder.goToInfoSelection = true
		get_tree().change_scene("res://DeckBuilder/Scenes/InfoSelection.tscn")

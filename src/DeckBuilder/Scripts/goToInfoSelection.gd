extends TextureButton


func _process(delta):
	if pressed:
		get_tree().change_scene("res://DeckBuilder/Scenes/InfoSelection.tscn")
		GlobalDeckBuilder.goToInfoSelection = true

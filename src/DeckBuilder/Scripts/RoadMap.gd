extends TextureButton


func _process(delta):
	if pressed:
		GlobalDeckBuilder.dimension = "Roadmap"
		get_tree().change_scene("res://DeckBuilder/Scenes/Info.tscn")
		GlobalDeckBuilder.goToInfo = true

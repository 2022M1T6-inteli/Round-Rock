extends VideoPlayer


func _physics_process(delta):
	if not is_playing():
		TransitionScreen.FadeInto("res://scenes/MainMenu.tscn")

extends CanvasLayer

var music_bus = AudioServer.get_bus_index("Music")
var effects_bus = AudioServer.get_bus_index("Effects")

func _ready():
	if(AudioServer.is_bus_mute(music_bus) == false):
		$Music.texture_normal = load("res://assets/borderButtons/buttonMusic.png")
	else:
		$Music.texture_normal = load("res://assets/borderButtons/buttonMuteMusic.png")
		
	if(AudioServer.is_bus_mute(effects_bus) == false):
		$Effects.texture_normal = load("res://assets/borderButtons/buttonSound.png")
	else:
		$Effects.texture_normal = load("res://assets/borderButtons/buttonMuteSound.png")

func _on_Music_pressed():
	if(AudioServer.is_bus_mute(music_bus) == false):
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
		$ButtonSound.play()
		$Music.texture_normal = load("res://assets/borderButtons/buttonMuteMusic.png")
	else:
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
		$ButtonSound.play()
		$Music.texture_normal = load("res://assets/borderButtons/buttonMusic.png")

func _on_Effects_pressed():
	if(AudioServer.is_bus_mute(effects_bus) == false):
		AudioServer.set_bus_mute(effects_bus, not AudioServer.is_bus_mute(effects_bus))
		$Effects.texture_normal = load("res://assets/borderButtons/buttonMuteSound.png")
	else:
		AudioServer.set_bus_mute(effects_bus, not AudioServer.is_bus_mute(effects_bus))
		$ButtonSound.play()
		$Effects.texture_normal = load("res://assets/borderButtons/buttonSound.png")

func _on_backButton_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/MainMenu.tscn")

extends Control

var music_bus = AudioServer.get_bus_index("Music")
var effects_bus = AudioServer.get_bus_index("Effects")
onready var preCarta = preload("res://scenes/carta.tscn")

export(Vector2) var _start_position = Vector2(0, -20)
export(Vector2) var _end_position = Vector2.ZERO
export(float) var fade_in_duration = 0.3
export(float) var fade_out_duration = 0.2

onready var center_cont = $ColorRect/CenterContainer

onready var root = get_tree().get_root()
onready var scene_root = root.get_child(root.get_child_count() - 1)
onready var tween = $Tween

func _ready():
	var teste = false
	if !!teste:
		print("teste avaliado")
	else:
		print("não avaliado")
	hide()

func close():
	get_tree().paused = false
	# Tween's interpolate_property has these arguments:
	# (Target object, "Property:OptionalSubProperty", From value, To value,
	# Tween duration, Transition type, Easing type, Optional delay)
	tween.interpolate_property(self, "modulate:a", 1.0, 0.0,
			fade_out_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(center_cont, "rect_position",
			_end_position, _start_position, fade_out_duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()


func open():
	show()
	$Sprite/CenterContainer/BackButton.grab_focus()
	tween.interpolate_property(self, "modulate:a", 0.0, 1.0,
			fade_in_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(center_cont, "rect_position",
			_start_position, _end_position, fade_in_duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()

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
		
		close()
		if modulate.a < 0.5:
			hide()
		else:
			$ButtonSound.play()
			

func _on_Tween_tween_all_completed():
	if modulate.a < 0.5:
		hide()

func _on_MainMenu_pressed():
	$ButtonSound.play()
	if $MainMenu.is_hovered() == true:
		$MainMenu.texture_normal = load("res://assets/borderButtons/mainMenuButtonPressed.png")
	yield(get_tree().create_timer(0.24), "timeout")
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	close()

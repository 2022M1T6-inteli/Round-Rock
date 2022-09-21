extends Node2D

func _on_play_button_pressed(): #this fuction is to start the game
	$ButtonSound.play()
	get_tree().change_scene("res://scenes/cidade1.tscn")
	
func _on_config_button_pressed():#leva para o menu do jogo, onde é possível fazer ajustes
	$ButtonSound.play()
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().change_scene("res://scenes/Settings.tscn")

func _on_quit_button_pressed():#essa função fecha o jogo
	$ButtonSound.play()
	yield(get_tree().create_timer(0.24), "timeout")
	get_tree().quit()

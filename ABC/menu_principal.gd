extends Node2D

func _on_play_button_pressed(): #essa funcão faz o jogo começar
	get_tree().change_scene("res://florestinha.tscn")
	
func _on_config_button_pressed():#leva para o menu do jogo, onde é possível fazer ajustes
	get_tree().change_scene("res://configuracoes.tscn")

func _on_quit_button_pressed():#essa função fecha o jogo
	get_tree().quit()



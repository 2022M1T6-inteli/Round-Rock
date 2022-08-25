extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vida
var automatico = true
var mouseIn
var mouseBattleIn
var posicaoXCarta
var cartaSelecionada
var hideCard = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.enemyPosition = $Mago.position
	#posicaoXCarta = get_node("YSort/Carta1").position

	vida = 100
	pass # Replace with function body.

func _process(delta):
	$healthBar.value -= 1
	if hideCard:
		hideCard(cartaSelecionada)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	if(automatico == true):
		automatico = false
	else:
		automatico = true
	pass # Replace with function body.

func _on_Carta1_mouse_exited():
	mouseIn = false
	if(mouseIn == false):
		get_node("YSort/Carta1").position = posicaoXCarta

	pass # Replace with function body.

func _on_AreaDeAcao1_area_exited(area):
	if($YSort/Carta1/Carta.pressed == false):
		get_node("YSort/Carta1/Carta").disabled = true
		$YSort/Carta1.visible = false
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://menu_principal.tscn")
	pass # Replace with function body.


func _on_carta1_pressed():
	$cartaAmpliada.self_modulate = "#ffffff"
	cartaSelecionada = $carta1
	
func _on_carta2_pressed():
	$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/marcelo vc me irrita.png")	
	$cartaAmpliada.self_modulate = "#ffffff"
	cartaSelecionada = $carta2
	
func _on_carta3_pressed():
	$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/this is a help message.png")	
	$cartaAmpliada.self_modulate = "#ffffff"
	cartaSelecionada = $carta2
	

func _on_cartaAmpliada_pressed():
	#$cartaAmpliada.visible = false
	hideCard = true
		
func hideCard(card):
	if card.self_modulate.a > 0:
		card.self_modulate.a -= 0.015
		$cartaAmpliada.self_modulate.a -= 0.015
		if card.self_modulate.a < 0.1:
			card.self_modulate.a = 0
			$cartaAmpliada.self_modulate.a = 0
	else:
		hideCard = false
		Global.attack = true


	

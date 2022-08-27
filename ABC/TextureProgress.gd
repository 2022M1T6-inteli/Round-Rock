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
var func_Timer = true


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
func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu_principal.tscn")
	pass # Replace with function body.



func _on_carta1_pressed():
	if func_Timer == true:
		$cartaAmpliada.visible = true
		$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/carta more!.png")	
		$cartaAmpliada.self_modulate = "#ffffff"
		cartaSelecionada = $carta1
		$carta1.visible = false
		$cartaAmpliada/execute.visible = true
		$cartaAmpliada/cancel.visible = true
		func_Timer = false
		Global.numberCard = 1
	else:
		pass
func _on_carta2_pressed():
	if func_Timer == true:
		$cartaAmpliada.visible = true
		$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/carta amarela  (1).png")	
		$cartaAmpliada.self_modulate = "#ffffff"
		cartaSelecionada = $carta2
		$carta2.visible = false
		$cartaAmpliada/execute.visible = true
		$cartaAmpliada/cancel.visible = true
		func_Timer = false
		Global.numberCard = 2
	else:
		pass
	
func _on_carta3_pressed():
	if func_Timer == true:
		$cartaAmpliada.visible = true
		$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/sight.png")	
		$cartaAmpliada.self_modulate = "#ffffff"
		cartaSelecionada = $carta3
		$carta3.visible = false
		$cartaAmpliada/execute.visible = true
		$cartaAmpliada/cancel.visible = true
		func_Timer = false
		Global.numberCard = 3
	else:
		pass
func _on_carta4_pressed():
	if func_Timer == true:
		$cartaAmpliada.visible = true
		$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/carta vermelha.png")	
		$cartaAmpliada.self_modulate = "#ffffff"
		cartaSelecionada = $carta4
		$carta4.visible = false
		$cartaAmpliada/execute.visible = true
		$cartaAmpliada/cancel.visible = true
		func_Timer = false
		Global.numberCard = 4
	else:
		pass
	
func _on_carta5_pressed():
	if func_Timer == true:
		$cartaAmpliada.visible = true
		$cartaAmpliada.texture_normal = load("res://Protótipo batalha - visão geral/Cartas/divine smite.png")	
		$cartaAmpliada.self_modulate = "#ffffff"
		cartaSelecionada = $carta5
		$carta5.visible = false
		$cartaAmpliada/execute.visible = true
		$cartaAmpliada/cancel.visible = true
		func_Timer = false
		Global.numberCard = 5
	else:
		pass
func _on_cartaAmpliada_pressed():
	#$cartaAmpliada.visible = false
	func_Timer = true
	hideCard = true
		
func hideCard(card):
	if card.self_modulate.a > 0:
		card.self_modulate.a -= 0.015
		$cartaAmpliada.self_modulate.a -= 0.015
		if card.self_modulate.a < 0.1:
			card.self_modulate.a = 0
			$cartaAmpliada.self_modulate.a = 0
			$cartaAmpliada.visible = false
			$cartaAmpliada/execute.visible = true
			$cartaAmpliada/cancel.visible = true
	else:
		hideCard = false
		Global.attack = true


	


	pass # Replace with function body.


func _on_cancel_pressed():
	$cartaAmpliada.visible = false 
	cartaSelecionada.visible = true
	func_Timer = true
	



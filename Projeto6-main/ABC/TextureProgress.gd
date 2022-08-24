extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vida
var automatico = true
var mouseIn
var mouseBattleIn
var posicaoXCarta

# Called when the node enters the scene tree for the first time.
func _ready():
	posicaoXCarta = get_node("YSort/Carta1").position

	vida = 100
	pass # Replace with function body.

func _process(delta):
	if (automatico):
		#$Control/ColorRect/Label.text = str(vida)
		$HealthBar.value = vida
		vida += 1
	else:
		#$Control/ColorRect/Label.text = str(vida)
		$HealthBar.value = vida
		vida -= 1
	pass

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

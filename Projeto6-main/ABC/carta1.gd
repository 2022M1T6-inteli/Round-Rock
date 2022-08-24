extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if $Carta.pressed:
		#$Carta1.visible=false
		var ponteiro = get_global_mouse_position()-global_position
		global_position += ponteiro
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://menu_principal.tscn")
	pass # Replace with function body.

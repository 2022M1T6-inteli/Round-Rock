extends Node2D

#func _ready():
#	$Control/CaixaDeDialogo.visible = false
#	$Control/RichTextLabel.visible = false
var cont = false

func _ready():
	$Control.visible = false
	
	
func _on_Detect_body_entered(_body):
	$Control.visible = true
	cont = true
	print(cont)
#
func _on_Detect_body_exited(_body):
	$Control.visible = false
	cont = false
	print(cont)
	
#func _physics_process(_delta):
#	if(cont == true and Input.is_action_just_pressed("ui_accept")):
#		$Control.visible= false
#		print("sou eu aqui")

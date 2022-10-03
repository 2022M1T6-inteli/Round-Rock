extends Node2D

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

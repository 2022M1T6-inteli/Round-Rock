extends Node2D

func _ready():
	$Control.visible = false
	
	
func _on_Detect_body_entered(_body):
	get_parent().get_node("Player").set_physics_process(false)
	get_parent().get_node("Player/AnimationPlayer").play("Stand")
	get_parent().get_node("Player/AudioStreamPlayer").stop()
	$Control.visible = true

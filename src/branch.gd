extends Area2D

export var speed = 500


func _process(delta):
	position.x -= speed * delta

func _on_branch_area_entered(area):
		GlobalBattle.cantClick = false
		queue_free() 

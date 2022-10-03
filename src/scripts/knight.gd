extends Area2D


export var speed = 600


func _process(delta):
	position.x -= speed * delta

func _on_knight_area_entered(area):
		GlobalBattle.cantClick = false
		queue_free() 

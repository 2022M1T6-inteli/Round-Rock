extends Area2D



export var speed = 300


func _process(delta):
	position.x -= speed * delta
	if position.x < 169:
		queue_free() 
		GlobalBattle.cantClick = false

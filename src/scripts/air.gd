extends Area2D

export var speed = 600


func _process(delta):
	position.x -= speed * delta

#air desapear
func _on_air_area_entered(area):
		GlobalBattle.cantClick = false
		queue_free() 

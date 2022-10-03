extends Area2D



export var speed = 300

func _process(delta):
	position.x -= speed * delta
	
func _on_laser_area_entered(area):
	queue_free() 
	GlobalBattle.cantClick = false
	

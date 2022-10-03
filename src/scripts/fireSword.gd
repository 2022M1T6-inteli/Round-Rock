extends Area2D


export var speed = 900


func _process(delta):
	position.x -= speed * delta

func _on_fireSword_area_entered(area):
		GlobalBattle.cantClick = false
		yield(get_tree().create_timer(0.13), "timeout")
		queue_free() 

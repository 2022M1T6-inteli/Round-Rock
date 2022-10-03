extends Area2D


export var speed = 700


func _process(delta):
	position.x -= speed * delta

func _on_magicBall_area_entered(area):
		GlobalBattle.cantClick = false
		yield(get_tree().create_timer(0.23), "timeout")
		queue_free() 

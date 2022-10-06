extends Area2D

export var speed = 10


func _process(delta):
	position.y += speed * delta

func _on_Magic_area_entered(area):
		yield(get_tree().create_timer(0.4), "timeout")
		GlobalBattle.cantClick = false
		queue_free() 

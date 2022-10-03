extends Area2D

export var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.x -= speed * delta


func _on_Espada_area_entered(area):
		queue_free() 
		GlobalBattle.cantClick = false

extends AnimatedSprite


var initialPosition = position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var atack = "attack"+ str(Global.numberCard)
	if Global.attack:
		if position.x < Global.enemyPosition.x - 100:
			position.x += 2
			if position.x >= Global.enemyPosition.x - 1000:
				animation = atack
		else:
			Global.attack = false
			Global.moveback = true
			
	if Global.moveback:
		if position.x > initialPosition:
			if position.x <= Global.enemyPosition.x - 300:
				animation = "run"
			position.x -= 3
		else:
			Global.moveback = false
			animation = "default"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

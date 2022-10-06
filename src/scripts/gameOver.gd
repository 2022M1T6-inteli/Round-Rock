extends Sprite

var blinking = false
var alphadown = true

func _ready():
	visible = false
	modulate.a = 0
	scale = Vector2(0,0)
	set_physics_process(false)
	if visible == true:
		$AudioStreamPlayer.play()
	
func _physics_process(delta):
	blinking = true
	
	modulate.a = lerp(modulate.a, 1, delta)
	scale.x = lerp(scale.x, 1, delta)
	scale.y = lerp(scale.y, 1, delta)
		
func gameOver():
	visible = true
	set_physics_process(true)

extends Sprite


var blinking = false
var alphadown = true

func _ready():
	visible = false
	modulate.a = 0
	scale = Vector2(0,0)
	set_physics_process(false)
	#$AudioStreamPlayer.play()
	#yield(get_tree().create_timer(2), "timeout")
	#$HeroIsDying.modulate.a = lerp(modulate.a, 0, 0.01)
	
	
func _physics_process(delta):
	blinking = true
	
	modulate.a = lerp(modulate.a, 1, delta)
	scale.x = lerp(scale.x, 1, delta)
	scale.y = lerp(scale.y, 1, delta)
	"""if blinking:
		if alphadown:
			$Label.modulate.a -= 0.02
		else:
			$Label.modulate.a += 0.02
	if $Label.modulate.a <= 0:
		alphadown = false
	elif $Label.modulate.a >= 1:
		blinking = false
		alphadown = true"""
		
func gameOver():
	visible = true
	set_physics_process(true)
	$AudioStreamPlayer.play()









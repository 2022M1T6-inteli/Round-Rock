extends Sprite

func _ready():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 6135
	$Player/Camera2D.limit_top = 0
	$Player/Camera2D.limit_bottom = 700
	$Player/Camera2D.zoom.x = 1
	$Player/Camera2D.zoom.y = 1
	Global.TARGET_FPS = 80
	Global.ACCELERATION = 80
	Global.MAX_SPEED = 400
	Global.FRICTION = 50
	Global.AIR_RESISTANCE = 1
	Global.GRAVITY = 27.5
	Global.JUMP_FORCE = 1000

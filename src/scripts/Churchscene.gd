extends Sprite

func _ready():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 4095
	$Player/Camera2D.limit_top = 0
	$Player/Camera2D.limit_bottom = 2048
	$Player/Camera2D.zoom.x = 1
	$Player/Camera2D.zoom.y = 1
	Global.TARGET_FPS = 80
	Global.ACCELERATION = 80
	Global.MAX_SPEED = 700
	Global.FRICTION = 50
	Global.AIR_RESISTANCE = 1
	Global.GRAVITY = 40
	Global.JUMP_FORCE = 1300
	Global


func _on_Area2D2_body_entered(body):
	GlobalTexts.dialogueStart = true

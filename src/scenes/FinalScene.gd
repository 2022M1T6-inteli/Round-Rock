extends Node2D


func _ready():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 2895
	$Player/Camera2D.limit_top = 0
	$Player/Camera2D.limit_bottom = 600
	$Player/Camera2D.zoom.x = 0.5
	$Player/Camera2D.zoom.y = 0.5
	Global.TARGET_FPS = 80
	Global.ACCELERATION = 45
	Global.MAX_SPEED = 200
	Global.FRICTION = 50
	Global.AIR_RESISTANCE = 1
	Global.GRAVITY = 13
	Global.JUMP_FORCE = 400

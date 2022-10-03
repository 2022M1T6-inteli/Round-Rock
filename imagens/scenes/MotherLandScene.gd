extends Node2D

func _ready():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 5288
	$Player/Camera2D.limit_top = -360
	$Player/Camera2D.limit_bottom = 687.5
	$Player/Camera2D.zoom.x = 0.9
	$Player/Camera2D.zoom.y = 0.9
	Global.TARGET_FPS = 80
	Global.ACCELERATION = 35
	Global.MAX_SPEED = 650
	Global.FRICTION = 50
	Global.AIR_RESISTANCE = 1
	Global.GRAVITY = 27
	Global.JUMP_FORCE = 800

func _process(delta):
	
	#Calls the dimension node
	if Input.is_action_just_pressed("dimensions"):
		GlobalDeckBuilder.sceneToReturnTo = get_filename()
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")

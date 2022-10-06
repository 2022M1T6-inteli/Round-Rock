extends Node2D

func _ready():
	$Player/Camera2D.limit_left = 0
	$Player/Camera2D.limit_right = 6624
	$Player/Camera2D.limit_top = 0
	$Player/Camera2D.limit_bottom = 7095
#	$Player/Camera2D.zoom.x = 1
#	$Player/Camera2D.zoom.y = 1
	Global.TARGET_FPS = 80
	Global.ACCELERATION = 80
	Global.MAX_SPEED = 1000
	Global.FRICTION = 50
	Global.AIR_RESISTANCE = 1
	Global.GRAVITY = 64
	Global.JUMP_FORCE = 2150
	$Portal/AnimatedSprite.visible = false

func _process(delta):
	
	#Calls the dimension node
	if Input.is_action_just_pressed("dimensions"):
		GlobalDeckBuilder.sceneToReturnTo = get_filename()
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")


func _on_Area2D_body_entered(body):
	GlobalTexts.dialogueStart = true

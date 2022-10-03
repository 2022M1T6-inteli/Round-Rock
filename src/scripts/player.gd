extends KinematicBody2D

export(PackedScene) var target_dialogue

var dirSprite = 1

func _ready():
	

#	Global.TARGET_FPS = 80
#	ACCELERATION = 80
#	MAX_SPEED = 1000
#	FRICTION = 50
#	AIR_RESISTANCE = 1
#	GRAVITY = 60
#	JUMP_FORCE = 2100
#	dirSprite = 1
	
#	export var TARGET_FPS = 80
#	export var ACCELERATION = 80
#	export var MAX_SPEED = 1000
#	export var FRICTION = 50
#	export var AIR_RESISTANCE = 1
#	export var GRAVITY = 60
#	export var JUMP_FORCE = 2100
#	var dirSprite = 1
	pass

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * Global.ACCELERATION * delta * Global.TARGET_FPS
		motion.x = clamp(motion.x, -Global.MAX_SPEED, Global.MAX_SPEED)
		if $Timer.time_left <= 0:
			$AudioStreamPlayer.pitch_scale = rand_range(0.6,0.9)
			$AudioStreamPlayer.play()
			$Timer.start(0.33)

		if x_input < 0:
			sprite.flip_h = true
			dirSprite = -1
			$CollisionShape2D.position.x = -0.8
		elif x_input > 0:
			sprite.flip_h = false
			dirSprite = 1
			$CollisionShape2D.position.x = 0.8
		
	else:
		animationPlayer.play("Stand")
		if $Timer.time_left > 0:
			$AudioStreamPlayer.stop()
			$Timer.stop()
	
	motion.y += Global.GRAVITY * delta * Global.TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, Global.FRICTION * delta)
			
		if Input.is_action_just_pressed("ui_up"):
			animationPlayer.play("Jump")
			motion.y = -Global.JUMP_FORCE
			$AudioStreamPlayer.stop()
			
	else:
		animationPlayer.play("Jump")
		$AudioStreamPlayer.stop()
		
		if Input.is_action_just_released("ui_up") and motion.y < -Global.JUMP_FORCE/2:
			motion.y = -Global.JUMP_FORCE/2
			animationPlayer.play("Jump")
			
		
		if motion.y > 0:
			motion.x = lerp(motion.x, 0, Global.AIR_RESISTANCE * delta)
			animationPlayer.play("Fall")
		
	motion = move_and_slide(motion, Vector2.UP)

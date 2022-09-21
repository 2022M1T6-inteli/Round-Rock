extends KinematicBody2D

export(PackedScene) var target_dialogue

const TARGET_FPS = 80
const ACCELERATION = 35
const MAX_SPEED = 650
const FRICTION = 50
const AIR_RESISTANCE = 1
const GRAVITY = 27
const JUMP_FORCE = 800
var dirSprite = 1

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
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
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
			
		if Input.is_action_just_pressed("ui_up"):
			animationPlayer.play("Jump")
			motion.y = -JUMP_FORCE
			
	else:
		animationPlayer.play("Jump")
		$AudioStreamPlayer.stop()
		
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
			animationPlayer.play("Jump")
			
		
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
			animationPlayer.play("Fall")
		
	motion = move_and_slide(motion, Vector2.UP)

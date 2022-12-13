extends Node2D

#hero's life

#variables that control the state of the hero
var moveFoward = false
var moveBack = false
var attack = false
onready var originalPosition = position
export var sceneToGo = ""
export var sceneToDie = ""

func _physics_process(delta):
	win()
	realDeath()
	goAttack()
	moveBack()


#change animations
func attack():
	$heroAnimation.animation = "attack"

func idle():
	$heroAnimation.animation = "idle"
	
func death():
	$heroAnimation.animation = "death"

func damage():
	$heroAnimation.animation = "damage"
	
func run():
	$heroAnimation.animation = "run"

func handsUp():
	$heroAnimation.animation = "handsUp"

#controls the attack movement of the hero
func goAttack():
	#GlobalBattle.heroDamage = -50
	
	if moveFoward:
		run()
		position.x += 4
		$heroAnimation/hurtBox.visible = false
		$attack.play()
	elif attack:
		
		attack()
	else:
		pass

#makes the hero get back to it's original position after an attack
func moveBack():
	if moveBack:
		run()
		$heroAnimation/hurtBox.visible = true
		$heroAnimation.flip_h = true
		position.x -= 4
		if position.x <= originalPosition.x:
			moveBack = false
			idle()
			$heroAnimation.flip_h = false
			
			GlobalBattle.cantClick = false

#analyses if the hero is dead
func realDeath():
	if GlobalBattle.heroLife <= 0:
		death()
		moveFoward = false
		moveBack = false
		attack = false
		get_parent().get_node("gameOver").gameOver()
		yield(get_tree().create_timer(1.5), "timeout")
		modulate.a = lerp(modulate.a, 0, 0.01)
		TransitionScreen.FadeInto(sceneToDie)
		if floor(modulate.a8) == 0:
			visible = false

#updates hero's life
	
func increaseLife(value):
	get_parent().get_node("heroHealthBar").increaseLife(value)

func decreaseLife(value):
	get_parent().get_node("heroHealthBar").decreaseLife(value)

#when the hero's collision shape collides with an other collision shape, start the attack animation
func _on_hitBox_area_entered(area):
	if position != originalPosition:
		attack = true
		moveFoward = false

#when the enemy's collision shape colides against the hero's, activates the demage animation
func _on_hurtBox_area_entered(area):
	if position == originalPosition:
		if GlobalBattle.catacombs:
			yield(get_tree().create_timer(0.3), "timeout")
		elif GlobalBattle.sanctuary:
			yield(get_tree().create_timer(0.5), "timeout")
		damage()
		decreaseLife(GlobalBattle.enemyDamage)

#when an animation is over set the hero into a different state
func _on_heroAnimation_animation_finished():
	if $heroAnimation.animation == "attack":
		attack = false
		moveBack = true
	elif $heroAnimation.animation == "damage":
		idle()
	elif $heroAnimation.animation == "handsUp":
		idle()
		GlobalBattle.cantClick = false

func win():
	if not GlobalBattle.enemyAlive:
		if position == originalPosition and GlobalTexts.dialogueStart:
			get_parent().get_node("Control").load_dialogueEnd()
		elif GlobalTexts.endDialogue:
			moveFoward = true
		if position.x > 1200:
				TransitionScreen.FadeInto(sceneToGo)

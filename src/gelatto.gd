extends AnimatedSprite

var pre_iceBall = preload("res://scenes/iceBall.tscn")#this function preloads the arrow scene will be used in arrow function
onready var originalPosition = position #sets the original position to the position the enemy starts in the scene
var dataAttack = [
	{"nome":"attack", "valor":5},
	{"nome":"melee", "valor":15},
	{"nome":"shield", "valor":8},
]#this is a list of dictionaries from which animations and damage are taken, this list is randomized on the line 34
var move = false #motion variable
var attack = false #attack variable
var moveBack = false #variable to return to the starting position
var damage = false
var death = false
var action = false #variable for animations
var animacao
var listAttack = []
var moveFoward = false
func _physics_process(delta):
	actions()
	moveBack()
	goAttack()
	
	
func _ready():
	randomize() #every time the scene is started the list of dictionaries will be randomized again, ensuring they are always random attacks
	listAttack()
	GlobalBattle.reset()
	GlobalBattle.enemyName = "gelatto"
	
func listAttack():
	for i in range(40):
		animacao = randi() % dataAttack.size()
		listAttack.append(dataAttack[animacao])
	
func dataAttack():
	if action:
		animation = listAttack[0].nome
		GlobalBattle.enemyDamage = listAttack[0].valor
		if animation == "shield":
			get_parent().get_node("enemyHealthBar").increaseShield(listAttack[0].valor)
			GlobalBattle.cantClick = false
			#$shield.play()
		elif animation == "attack":
			yield(get_tree().create_timer(0.5), "timeout")
			iceBall()
		
		action = false
		GlobalCards.drawCards = true
		listAttack.pop_front()
		
func goAttack():
	if moveFoward:
		position.x -= 2.5
		melee()
	elif attack:
		attack()
		
func _on_TextureButton_pressed():
	if not GlobalBattle.cantClick:
		"""not GlobalCards.waitCardExtinguish and"""
		action = true
		GlobalBattle.heroActualMana = GlobalBattle.heroTotalMana
		GlobalBattle.cantClick = true
		dataAttack()
		get_parent().get_node("enemyData").decreaseNextEnemyAttack()
	
func actions():
	if animation == "melee" and not attack:
		moveFoward = true
		
		
	if GlobalBattle.enemyLife <= 0:
			death = true
			move = false
			attack = false
			moveBack = false
			damage = false
			animation = "death"
			yield(get_tree().create_timer(1.8), "timeout")
			GlobalBattle.enemyAlive = false
			modulate.a = lerp(modulate.a, 0, 0.05)
			if floor(modulate.a8) == 0:
				visible = false
				queue_free()
				
func attack():
	animation = "attack1"
func run():
	animation = "run"
	
func melee():
	animation = "melee"
	
func moveBack():
	if not death:
		if moveBack:
			run()
			flip_h = true
			position.x += 2.5
			if position.x >= originalPosition.x:
				animation = "idle"
				moveBack = false
				flip_h = false
				
				GlobalBattle.cantClick = false
				
func increaseLife(value):
	get_parent().get_node("enemyHealthBar").increaseLife(value)
func decreaseLife():
	get_parent().get_node("enemyHealthBar").decreaseLife(GlobalBattle.heroDamage)
func iceBall():
	yield(get_tree().create_timer(0.5), "timeout")
	var iceBall = pre_iceBall.instance()
	get_parent().add_child(iceBall)
	#$arrow.play()
	
func _on_hitBox_area_entered(area):
	if position != originalPosition:
		moveFoward = false
		attack = true
	pass # Replace with function body.
	
func _on_hurtBox_area_entered(area):
	if position == originalPosition:
		yield(get_tree().create_timer(0.5), "timeout")
		animation = "damage"
		print("PRÉ-SHAKE")
		if GlobalBattle.heroUserKpi:
			GlobalBattle.camera.shake(0.5,5)
			print("PASSOU-SHAKE")
			get_parent().get_node("heroHealthBar").decreaseUserKpi()
		#$damage.play()
		decreaseLife()
func _on_gelatto_animation_finished():
	if not death and not moveBack and not moveFoward:
		if animation == "attack1":
			moveBack = true
			attack = false
		elif "shield":
			pass
		animation = "idle"









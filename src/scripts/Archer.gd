extends AnimatedSprite

var pre_arrow = preload("res://scenes/arrow.tscn")#this function preloads the arrow scene will be used in arrow function
var pre_air = preload("res://scenes/air.tscn")#this function preloads the air scene will be used in air function
onready var originalPosition = position #sets the original position to the position the enemy starts in the scene
var dataAttack = [
	{"nome":"attack", "valor":5},
	{"nome":"melee", "valor":10},
	{"nome":"shield", "valor":5},
	{"nome":"spin", "valor":12}
]#this is a list of dictionaries from which animations and damage are taken, this list is randomized on the line 34
var move = false #motion variable
var attack = false #attack variable
var moveBack = false #variable to return to the starting position
var damage = false
var death = false
var action = false #variable for animations
var animacao
var listAttack = []
func _physics_process(delta):
	actions()
	moveBack()
	
	
func _ready():
	randomize() #every time the scene is started the list of dictionaries will be randomized again, ensuring they are always random attacks
	listAttack()
	GlobalBattle.reset()
	GlobalBattle.enemyName = "Archer"
	
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
			yield(get_tree().create_timer(0.8), "timeout")
			#$shield.play()
		elif animation == "spin":
			air()
		elif animation == "attack":
			Arrow()
		
		action = false
		GlobalCards.drawCards = true
		listAttack.pop_front()
		
func _on_TextureButton_pressed():
	if not GlobalBattle.cantClick: 
		"""not GlobalCards.waitCardExtinguish and""" 
		action = true
		GlobalBattle.heroActualMana = GlobalBattle.heroTotalMana
		GlobalBattle.cantClick = true
		dataAttack()
		get_parent().get_node("enemyData").decreaseNextEnemyAttack()
	
func actions():
	if animation == "melee":
		position.x -= 4.1
		
	if GlobalBattle.enemyLife <= 0:
			death = true
			move = false
			attack = false
			moveBack = false
			damage = false
			animation = "death"
			yield(get_tree().create_timer(1.5), "timeout")
			GlobalBattle.enemyAlive = false
			modulate.a = lerp(modulate.a, 0, 0.05)
			if floor(modulate.a8) == 0:
				visible = false
				queue_free()
				
func run():
	animation = "run"
			
func moveBack():
	if not death:
		if moveBack:
			run()
			flip_h = false
			position.x += 3.5
			if position.x >= originalPosition.x:
				animation = "idle"
				moveBack = false
				flip_h = true
				
				GlobalBattle.cantClick = false
				
func increaseLife(value):
	get_parent().get_node("enemyHealthBar").increaseLife(value)

func decreaseLife():
	get_parent().get_node("enemyHealthBar").decreaseLife(GlobalBattle.heroDamage)

func Arrow():
	yield(get_tree().create_timer(1.2), "timeout")
	var arrow = pre_arrow.instance()
	get_parent().add_child(arrow)
	#$arrow.play()
	
	
func air():
	yield(get_tree().create_timer(0.2), "timeout")
	var air = pre_air.instance()
	get_parent().add_child(air)
	#$laser.play()
	
	
	
func _on_hitbox_area_entered(area):
	if position != originalPosition:
		move = false
		attack = true
	
func _on_hurtBox_area_entered(area):
	if position == originalPosition:
		animation = "damage"
		yield(get_tree().create_timer(0.3), "timeout")
		if GlobalBattle.heroUserKpi: 
			GlobalBattle.camera.shake(0.5,5)
			get_parent().get_node("heroHealthBar").decreaseUserKpi()
		#$damage.play()
		decreaseLife()
		print("tomou dano - vida inimigo:", get_parent().get_node("enemyHealthBar/HealthBar").value)
		print("vida hero:", get_parent().get_node("heroHealthBar/HealthBar").value)


func _on_Archer_animation_finished():
	if not death and not moveBack:
		if animation == "melee":
			moveBack = true
			attack = false
		elif "shield":
			pass
			#print("fique falso enemy animation fineshed ANTES: ", GlobalBattle.cantClick)
			#GlobalBattle.cantClick = false
			#print("fique falso enemy animation fineshed DEPOIS: ", GlobalBattle.cantClick)
		animation = "idle"
	

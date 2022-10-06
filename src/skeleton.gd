extends AnimatedSprite

var pre_bone = preload("res://scenes/Bone.tscn")#this function preloads the arrow scene will be used in arrow function
onready var originalPosition = position #sets the original position to the position the enemy starts in the scene
var dataAttack = [
	{"nome":"attack", "valor":10},
	{"nome":"melee", "valor":25},
	{"nome":"shield", "valor":15},
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
	GlobalBattle.enemyName = "Skeleton"
	animation = "spawn"

#genarate a random list of attacks	
func listAttack():
	for i in range(40):
		animacao = randi() % dataAttack.size()
		listAttack.append(dataAttack[animacao])
	
#iniciate attack
func dataAttack():
	if action:
		animation = listAttack[0].nome
		GlobalBattle.enemyDamage = listAttack[0].valor
		if animation == "shield":
			get_parent().get_node("enemyHealthBar").increaseShield(listAttack[0].valor)
			GlobalBattle.cantClick = false
			#$shield.play()
		elif animation == "attack":
			bone()
		
		action = false
		GlobalCards.drawCards = true
		listAttack.pop_front()

#end round
func _on_TextureButton_pressed():
	if not GlobalBattle.cantClick: 
		"""not GlobalCards.waitCardExtinguish and""" 
		action = true
		GlobalBattle.heroActualMana = GlobalBattle.heroTotalMana
		GlobalBattle.cantClick = true
		dataAttack()
		get_parent().get_node("enemyData").decreaseNextEnemyAttack()
	
#manage attack
func actions():
	if animation == "melee":
		position.x -= 5.1
	
		
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
				
#run animation
func run():
	animation = "run"
			
#moveback to its's original position
func moveBack():
	if not death:
		if moveBack:
			run()
			flip_h = false
			position.x += 5.1
			if position.x >= originalPosition.x:
				animation = "idle"
				moveBack = false
				flip_h = true
				
				GlobalBattle.cantClick = false
				
func increaseLife(value):
	get_parent().get_node("enemyHealthBar").increaseLife(value)

func decreaseLife():
	get_parent().get_node("enemyHealthBar").decreaseLife(GlobalBattle.heroDamage)

#intance bone attack
func bone():
	yield(get_tree().create_timer(0.9), "timeout")
	var bone = pre_bone.instance()
	get_parent().add_child(bone)
	#$arrow.play()
	
#dettect collision when attack
func _on_hitBox_area_entered(area):
	if position != originalPosition:
		move = false
		attack = true
	pass # Replace with function body.
	
#dettect collision when damaged
func _on_hurtBox_area_entered(area):
	if position == originalPosition:
		animation = "damage"
		print("fui tocado")
		yield(get_tree().create_timer(0.3), "timeout")
		if GlobalBattle.heroUserKpi: 
			GlobalBattle.camera.shake(0.5,5)
			get_parent().get_node("heroHealthBar").decreaseUserKpi()
		#$damage.play()
		decreaseLife()

#change state when animation finished
func _on_skeleton_animation_finished():
	if not death and not moveBack:
		if animation == "melee":
			moveBack = true
			attack = false
		elif "shield":
			pass
		animation = "idle"



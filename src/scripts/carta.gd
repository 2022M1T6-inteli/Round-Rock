extends Node2D

#variables used to move the card to de center of the screen and than move back to it's original position
onready var originalPosition = position
onready var originalScale = scale
var centerPosition

#varibale utilized to queu.free()
onready var extinguish = false

#variable tha detects if a card was pressed 
onready var clicked = false

#atributs
var cardName
var type
var cost
var damage
var shield
var heal
var multiply
var plus
var scry
var dataCard
var dataEnemy

func _ready():
	centerPosition = Vector2(512,288)#Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	
func _physics_process(delta):
	moveCard()
	extinguishOn(delta)
	zIndex()

#func that utilizes the function lerp to move the card to the center or to it's original position, with a designed speed
func moveCard():
	if clicked:
		position = position.linear_interpolate(centerPosition,0.05)
		scale = scale.linear_interpolate(Vector2(1,1),0.02)
		if position.x >= centerPosition.x - 0.01 and position.x < centerPosition.x or position.x > centerPosition.x and position.x < centerPosition.x + 0.01:
			position = centerPosition	
	else:
		position = position.linear_interpolate(originalPosition,0.05)
		scale = scale.linear_interpolate(originalScale,0.02)
		if position.x > originalPosition.x and position.x < originalPosition.x + 0.01 or position.x > originalPosition.x - 0.01 and position.x < originalPosition.x:
			position = originalPosition
		
#func that changes the value of the buttons and the cliked variable to lerp
func buttons():
	if clicked:
		$declineButtom.showButton = true
		$confirmButton.showButton = true
	else:
		$declineButtom.showButton = false
		$confirmButton.showButton = false
		
#func to queue_free the object
func extinguishOn(delta):
	if extinguish == true:
		modulate.a = lerp(modulate.a, 0, delta+0.05)
		if modulate.a8 == 0:
			GlobalCards.waitCardExtinguish = false
			battleAction()
			GlobalCards.positionCard.append(originalPosition)
			GlobalCards.untilCard += 1
			queue_free()

#func that guarantee that the card will be over everything
func zIndex():
	if clicked:
		z_index += 1
	else:
		z_index = lerp(z_index, 0, 0.05)		

#called inside the extinquishOn func, used to attribute the values of the card to the GlobalBattle variables
func battleAction():
	match type:
		"deployment":
			GlobalBattle.heroTotalMana += 1
			GlobalBattle.heroActualMana += 1
			GlobalBattle.cantClick = false
		"business":
			if damage != 0:
				GlobalBattle.heroDamage = damage * GlobalBattle.heroMultiply + GlobalBattle.heroDamagePlus + GlobalBattle.heroPlus
				
				if GlobalBattle.heroUserKpi: GlobalBattle.heroDamage *= 2
				
				get_parent().get_node("hero").moveFoward = true
				GlobalBattle.heroDamagePlus = 0
			else:#shield
				shield *= GlobalBattle.heroMultiply
				shield += GlobalBattle.heroPlus
				
				if GlobalBattle.heroUserKpi: shield*= 2
				
				get_parent().get_node("heroHealthBar").increaseShield(shield)
				GlobalBattle.cantClick = false
			GlobalBattle.heroMultiply = 1
			GlobalBattle.heroPlus = 0
		"vision":
			if heal != 0:
				if GlobalBattle.heroUserKpi: 
					GlobalBattle.camera.shake(0.5,5)
					get_parent().get_node("heroHealthBar").decreaseUserKpi()
					heal *= 2
				get_parent().get_node("hero").handsUp()
				get_parent().get_node("heroHealthBar").increaseLife(heal * GlobalBattle.heroMultiply + GlobalBattle.heroPlus)
			else:
				GlobalBattle.heroDamagePlus = plus
			GlobalBattle.heroMultiply = 1
			GlobalBattle.cantClick = false
		"data":
			get_parent().get_node("hero").handsUp()
			if dataCard != 0:
				get_parent().get_node("cardData").showNextCards(5*GlobalBattle.heroMultiply)
			else:#dataEnemy
				get_parent().get_node("enemyData").showNextEnemyAttack(5*GlobalBattle.heroMultiply)
			
			GlobalBattle.heroMultiply = 1
			GlobalBattle.cantClick = false
		"quality":
			get_parent().get_node("hero").handsUp()
			if multiply != 0:
				GlobalBattle.heroMultiply = multiply
			else:
				GlobalBattle.heroPlus = plus
			GlobalBattle.cantClick = false











	
		

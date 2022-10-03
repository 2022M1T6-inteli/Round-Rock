extends Node2D

#variables used to move the card to de center of the screen and than move back to it's original position
onready var originalPosition = position
onready var originalScale = scale
onready var centerPosition = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)

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
var data


func _physics_process(delta):
	moveCard()
	extinguishOn(delta)
	zIndex()
	showHowManyCopiesInDeck()

#func that utilizes the function lerp to move the card to the center or to it's original position, with a designed speed
func moveCard():
	if clicked:
		position = position.linear_interpolate(centerPosition,0.05)
		scale = scale.linear_interpolate(Vector2(1.7,1.7),0.02)
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
			queue_free()

#func that guarantee that the card will be over everything
func zIndex():
	if clicked:
		z_index += 1
	else:
		z_index = lerp(z_index, 0, 0.05)
		
func showHowManyCopiesInDeck():
	var count = 0
	for dict in GlobalDeckBuilder.deckDictionary:
		if dict.name == $name.text:
			count += 1
	#$cardCount.text = str(Global.deck.count(self)) + "/5"
	$cardCount.text = str(count) + "/5"
		


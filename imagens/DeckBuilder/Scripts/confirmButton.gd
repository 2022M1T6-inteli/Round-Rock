extends Button

onready var showButton = false

func _ready():
	visible = false
	modulate.a = 0

func _physics_process(delta):
	modulate(delta)

#func that uses lerp to modulate the alpha of the RGB 
func modulate(delta):
	if showButton:
		visible = true
		modulate.a = lerp(modulate.a, 1, delta)
	elif not showButton:
		modulate.a = lerp(modulate.a, 0, delta)
		if floor(modulate.a8) == 0:
			visible = false

#func that detects if the confirm button of the card was pressed to queue_free the card
func _on_confirmButton_pressed():
	#get_parent().extinguish = true
	#Global.oneCardOnly = false
	var count = 0
	for card in GlobalDeckBuilder.deckDictionary:
		if card.name == get_parent().get_node("name").text:
			count += 1
	if count < 5 and len(GlobalDeckBuilder.deck) < 60:
		GlobalDeckBuilder.deck.append(get_parent())
		for card in GlobalDeckBuilder.ownedCards:
			if card.name == get_parent().get_node("name").text:
				GlobalDeckBuilder.deckDictionary.append(card)
				break
	

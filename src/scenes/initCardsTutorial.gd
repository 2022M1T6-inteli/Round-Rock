extends Node2D

onready var preCarta = preload("res://scenes/carta.tscn")

var cartas = GlobalDeckBuilder.deckDictionary

var deck = []

func _ready():
	GlobalCards.reset()
	GlobalBattle.catacombs = true
	instanceCard()
	#showDeck(GlobalCards.nextCard, GlobalCards.untilCard)
	$trilhaSonora.play()

#start the enemys turn
func _physics_process(delta):
	drawCards()

#this func add the cards on the screen, inside the scene
func showDeck(start,end):
	for i in range(start, end):
		print(deck)
		add_child(deck[i])
	GlobalCards.nextCard = GlobalCards.untilCard


func drawCards():
	if GlobalCards.drawCards and GlobalCards.nextCard < len(deck):
		get_node("cardData").decreaseNextCards()
		get_node("heroHealthBar").userKpi()
		if GlobalCards.untilCard >= len(deck):
			GlobalCards.untilCard = len(deck)
		var positionCardIndex = 0
		for i in range(GlobalCards.nextCard, GlobalCards.untilCard):
			deck[i].position = GlobalCards.positionCard[positionCardIndex]
			positionCardIndex += 1
			add_child(deck[i])
			
		GlobalCards.nextCard = GlobalCards.untilCard
		GlobalCards.drawCards = false
		GlobalCards.positionCard = []
		GlobalBattle.showNextCards = 0
	elif GlobalCards.nextCard >= len(deck):
		GlobalCards.noMoreCards = true
	
#the func that instance new cards inside a list called Deck
func instanceCard():
	
	for card in cartas:
		deck.append(card(card))
	
	
	var x = 200
	var y = 500
	for i in range(0,7):
		deck[i].position = Vector2(x,y)
		x += 100
	
	print(deck)
#func to instance a new card
func card(cardInfo):
	var carta = preCarta.instance()
	carta.scale = Vector2(0.5,0.5)
	carta.get_node("background").texture = load("res://assets/cartas/background/"+cardInfo["type"]+"Background.png")
	carta.get_node("background").texture = load("res://assets/cartas/background/"+cardInfo["type"]+"Background.png")
	carta.get_node("image").texture = load("res://DeckBuilder/Assets/newCardBackgrounds/"+cardInfo["name"]+".png")
	var sizeto = Vector2(150,135)
	#var size = load("res://DeckBuilder/Assets/newCardBackgrounds/"+cardInfo["name"]+".png").get_size()
	#print(size)
	#var scale_factor = sizeto/size
	#carta.get_node("image").scale = scale_factor
	carta.get_node("custo").texture = load("res://assets/cartas/custo/custo"+str(cardInfo["cost"])+".png")
	carta.get_node("name").text = cardInfo["name"]
	carta.get_node("description").text = cardInfo["description"]
	carta.cost = cardInfo["cost"]
	carta.type = cardInfo["type"]
	carta.cardName = cardInfo["name"]
	#building the card by it's type
	match cardInfo["type"]:
		"business":
			carta.damage = cardInfo["damage"]
			carta.shield = cardInfo["shield"]
		"vision":
			carta.heal = cardInfo["heal"]
			carta.plus = cardInfo["plus"]
		"data":
			carta.dataCard = cardInfo["dataCards"]
			carta.dataEnemy = cardInfo["dataEnemy"]
		"quality":
			carta.plus = cardInfo["plus"]
			carta.multiply = cardInfo["multiply"]
	
	return carta


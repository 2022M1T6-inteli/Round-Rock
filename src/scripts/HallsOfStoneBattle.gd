extends Node2D

onready var preCarta = preload("res://scenes/carta.tscn")

var cartas = GlobalCards.cardDic

var deck = []

func _ready():
	GlobalCards.nextCard = 0
	GlobalCards.untilCard = 7
	instanceCard()
	showDeck(GlobalCards.nextCard, GlobalCards.untilCard)
	$trilhaSonora.play()
#start the enemys turn
func _physics_process(delta):
	drawCards()

#this func add the cards on the screen, inside the scene
func showDeck(start,end):
	for i in range(start, end):
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
	var x = 200
	var y = 500
	for card in cartas:
		deck.append(card(card, x, y))
		x += 100
		if x == 900:
			x = 300

#func to instance a new card
func card(cardInfo, x, y):
	var carta = preCarta.instance()
	carta.position = Vector2(x,y)
	carta.scale = Vector2(0.5,0.5)
	carta.get_node("background").texture = load("res://assets/cartas/background/"+cardInfo["type"]+"Background.png")
	#carta.get_node("image").texture = load("res://assets/cartas/images/"+cardInfo["testImage"]+".png")
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
			carta.dataCard = cardInfo["dataCard"]
			carta.dataEnemy = cardInfo["dataEnemy"]
		"quality":
			carta.plus = cardInfo["plus"]
			carta.multiply = cardInfo["multiply"]
	
	return carta

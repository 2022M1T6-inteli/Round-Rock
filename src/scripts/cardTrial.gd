extends Node2D

var x = 100
var y = 200

onready var preCarta = preload("res://scenes/carta.tscn")

var cartas = GlobalCards.cardDic

var deck = []

func _ready():
	instanceCard()
	showDeck()

#this func add the cards on the screen, inside the scene
func showDeck():
	for i in range(0,5):
		add_child(deck[i])

#func that calls the func that instance new cards inside a list called Deck
func instanceCard():
	for card in cartas:
		deck.append(card(card))

#func to instance a new card
func card(cardInfo):
	var carta = preCarta.instance()
	carta.position = Vector2(x,y)
	x += 200
	carta.get_node("background").texture = load("res://assets/cartas/background/"+cardInfo["type"]+"Background.png")
	carta.get_node("image").texture = load("res://assets/cartas/images/"+cardInfo["testImage"]+".png")
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
			carta.data = cardInfo["data"]
			carta.scry = cardInfo["scry"]
		"quality":
			carta.plus = cardInfo["plus"]
			carta.multiply = cardInfo["multiply"]
	
	return carta


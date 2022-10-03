extends Node2D


var x = 280
var y = 230
var visibleCards = []
onready var preCarta = preload("res://DeckBuilder/Scenes/carta.tscn")


func _ready():
	position.x -= 120
	setVisibleCards(GlobalDeckBuilder.dimension)
	showBanner()
	showCards(visibleCards)


func card(cardInfo):
	var carta = preCarta.instance()
	carta.position = Vector2(x,y)
	x += 110
	if x >= 800:
		x = 280
		y += 140
	carta.get_node("background").texture = load("res://DeckBuilder/assets/cartas/background/"+cardInfo["type"]+"Background.png")
	carta.get_node("image").texture = load("res://DeckBuilder/assets/cartas/images/"+cardInfo["testImage"]+".png")
	carta.get_node("custo").texture = load("res://DeckBuilder/assets/cartas/custo/custo"+str(cardInfo["cost"])+".png")
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
	

# Ensures that only the cards of the clicked dimension are shown
func setVisibleCards(dimension):
	for card in GlobalDeckBuilder.ownedCards:
		if card.type == dimension:
			visibleCards.append(card(card))
			
# Function used to display the banner in the card scene
func showBanner():
	var zIndexController = Node2D.new()
	var bannerPosition = Vector2(500,70)
	var banner = Sprite.new()
	banner.texture = load("res://DeckBuilder/Assets/Banners/" + GlobalDeckBuilder.dimension + "Banner.png")
	banner.position = bannerPosition
	zIndexController.z_index = 10
	zIndexController.add_child(banner)
	add_child(zIndexController)
			
# Instantiates the cards
func showCards(cards):
	for i in range(len(visibleCards)):
		add_child(visibleCards[i])

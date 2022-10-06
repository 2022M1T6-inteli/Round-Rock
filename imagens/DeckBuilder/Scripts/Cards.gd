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
	for child in get_children():
		if child.name == "carta":
			print(child.position)


func card(cardInfo):
	var carta = preCarta.instance()
	carta.position = Vector2(x,y)
	x += 110
	if x >= 800:
		x = 280
		y += 140
	carta.scale = Vector2(0.5,0.5)
	carta.get_node("background").texture = load("res://assets/cartas/background/"+cardInfo["type"]+"Background.png")
	carta.get_node("image").texture = load("res://DeckBuilder/Assets/newCardBackgrounds/"+cardInfo["name"]+".png")
#	var sizeto = Vector2(150,135)
#	var size = carta.get_node("image").texture.get_size()
#	var scale_factor = sizeto/size
#	carta.get_node("image").scale = scale_factor
	carta.get_node("custo").texture = load("res://DeckBuilder/assets/cartas/custoDeckBuilder/custo"+str(cardInfo["cost"])+".png")
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
		pass

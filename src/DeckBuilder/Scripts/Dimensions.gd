extends Node2D

# A list of dimensions (dictionaries) used to create each of the dimension buttons
var dimensionList = [
					{"name":"vision", "image":"res://DeckBuilder/Assets/DimensionButtons/VisionButton.png"},
					{"name":"business", "image":"res://DeckBuilder/Assets/DimensionButtons/BusinessButton.png"},
					{"name":"quality", "image":"res://DeckBuilder/Assets/DimensionButtons/QualityButton.png"},
					{"name":"deployment", "image":"res://DeckBuilder/Assets/DimensionButtons/DeploymentButton.png"},
					{"name":"data", "image":"res://DeckBuilder/Assets/DimensionButtons/DataButton.png"}
					]

					
func _ready():
	showDimensions()
	position.x -= 120


func showDimensions():
	var position = Vector2(300, 50)
	var size = Vector2(450, 102)
	# The for loop that creates the buttons
	for dimension in dimensionList:
		var dimensionButton = TextureButton.new()
		# This next 2 lines are necessary to be able to change the size of the button
		dimensionButton.expand = true
		dimensionButton.stretch_mode = TextureButton.STRETCH_SCALE
		# Defining the position, size and texture of the buttons
		dimensionButton.rect_position = position
		dimensionButton.rect_size = size
		dimensionButton.texture_normal = load(dimension.image)
		# Changing the position of the next buttons
		position.y += 100
		# Connecting the button to it's function
		dimensionButton.connect("pressed", self, "_" + dimension.name + "_pressed")
		add_child(dimensionButton)
	
	
#Functions to check which dimension was pressed and call the cards scene
func _vision_pressed():
	GlobalDeckBuilder.dimension = "vision"
	get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
	GlobalDeckBuilder.goToCards = true
	
func _business_pressed():
	GlobalDeckBuilder.dimension = "business"
	get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
	GlobalDeckBuilder.goToCards = true
	
func _quality_pressed():
	GlobalDeckBuilder.dimension = "quality"
	get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
	GlobalDeckBuilder.goToCards = true
	
func _deployment_pressed():
	GlobalDeckBuilder.dimension = "deployment"
	get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
	GlobalDeckBuilder.goToCards = true

func _data_pressed():
	GlobalDeckBuilder.dimension = "data"
	get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
	GlobalDeckBuilder.goToCards = true

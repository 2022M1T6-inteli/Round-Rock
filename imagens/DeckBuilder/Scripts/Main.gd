extends Node2D

#Preloads the necessary scenes
onready var preDimensions = preload("res://DeckBuilder/Scenes/Dimensions.tscn")
onready var preCards = preload("res://DeckBuilder/Scenes/Cards.tscn")
onready var preInfoSelection = preload("res://DeckBuilder/Scenes/InfoSelection.tscn")
onready var preInfo = preload("res://DeckBuilder/Scenes/Info.tscn")

func _process(delta):
	
	""""#Calls the dimension node
	if Input.is_action_just_pressed("dimensions"):
		var dimensions = preDimensions.instance()
		add_child(dimensions)
	
	#Kills all children and than summons the dimensions node
	if GlobalDeckBuilder.returnToDimensions:
		for child in get_children():
			if child.name == "Cards":
				child.queue_free()
		var dimensions = preDimensions.instance()
		add_child(dimensions)
		GlobalDeckBuilder.returnToDimensions = false
	
	#Kills all children and then summons the cards node
	if GlobalDeckBuilder.goToCards:
		for child in get_children():
			if child.name == "Dimensions":
				child.queue_free()
		var cards = preCards.instance()
		add_child(cards)
		GlobalDeckBuilder.goToCards = false
		
	# Kills the dimensions node
	if GlobalDeckBuilder.clearDimensions:
		for child in get_children():
			if child.name == "Dimensions":
				child.queue_free()
		GlobalDeckBuilder.clearDimensions = false
		
	if GlobalDeckBuilder.goToInfoSelection:
		for child in get_children():
			if child.name == "Dimensions" or child.name == "Info":
				child.queue_free()
		var infoSelection = preInfoSelection.instance()
		add_child(infoSelection)
		GlobalDeckBuilder.goToInfoSelection = false
		
	if GlobalDeckBuilder.goToInfo:
		for child in get_children():
			if child.name == "InfoSelection":
				child.queue_free()
		var info = preInfo.instance()
		add_child(info)
		GlobalDeckBuilder.goToInfo = false
		
	if GlobalDeckBuilder.clearInfoSelection:
		for child in get_children():
			if child.name == "InfoSelection":
				child.queue_free()
		GlobalDeckBuilder.returnToDimensions = true
		GlobalDeckBuilder.clearInfoSelection = false"""
		
	if GlobalDeckBuilder.returnToDimensions:
		get_tree().change_scene("res://DeckBuilder/Scenes/Dimensions.tscn")
		GlobalDeckBuilder.returnToDimensions = false
	
	if GlobalDeckBuilder.goToCards:
		get_tree().change_scene("res://DeckBuilder/Scenes/Cards.tscn")
		GlobalDeckBuilder.goToCards = false
		
	if GlobalDeckBuilder.goToInfoSelection:
		get_tree().change_scene("res://DeckBuilder/Scenes/InfoSelection.tscn")
		GlobalDeckBuilder.goToInfoSelection = false
		
	if GlobalDeckBuilder.goToInfo:
		get_tree().change_scene("res://DeckBuilder/Scenes/Info.tscn")
		GlobalDeckBuilder.goToInfo = false
		
	if GlobalDeckBuilder.clearDimensions:
		get_tree().change_scene(GlobalDeckBuilder.sceneToReturnTo)
		GlobalDeckBuilder.clearDimensions = false

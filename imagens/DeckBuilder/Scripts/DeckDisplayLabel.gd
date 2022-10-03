extends Label


# warning-ignore:unused_argument
func _process(delta):
	displayDeck()

# Function to define the text of the label
func displayDeck():
	var textOfTheLabel = "Deck:\n" + str(len(GlobalDeckBuilder.deckDictionary)) + "/60\n\n"
	var cardsAlreadyDisplayed = []
	for card in GlobalDeckBuilder.deckDictionary:
		if not card.name in cardsAlreadyDisplayed:
			textOfTheLabel = textOfTheLabel + (card.name + " (x" + str(GlobalDeckBuilder.deckDictionary.count(card)) + ")\n")
			cardsAlreadyDisplayed.append(card.name)
	text = textOfTheLabel

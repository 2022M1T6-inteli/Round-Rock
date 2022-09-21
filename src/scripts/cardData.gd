extends Label

var nextCards = 0

func _ready():
	text = ""

func showNextCards(n):
	if nextCards >= GlobalCards.nextCard + GlobalBattle.showNextCards:
		nextCards += n 
		text = "Next cards: \n"
		
		for i in range(GlobalCards.nextCard, nextCards):
			text += get_parent().deck[i].cardName + "\n"
	else:
		nextCards = n + GlobalCards.nextCard
		text = "Next cards: \n"
		
		for i in range(GlobalCards.nextCard, nextCards):
			text += get_parent().deck[i].cardName + "\n"
			
func decreaseNextCards():
	if nextCards >= GlobalCards.nextCard + GlobalBattle.showNextCards:
		text = "Next cards: \n"
		
		for i in range(GlobalCards.nextCard + GlobalBattle.showNextCards, nextCards):
			text += get_parent().deck[i].cardName + "\n"
	else:
		text = ""

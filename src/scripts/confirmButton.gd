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
	if GlobalBattle.heroActualMana - get_parent().cost >= 0 and not GlobalBattle.cantClick:
		GlobalBattle.heroActualMana -= get_parent().cost
		GlobalCards.waitCardExtinguish = true
		get_parent().extinguish = true
		GlobalCards.oneCardOnly = false
		GlobalBattle.cantClick = true
		GlobalBattle.showNextCards += 1
	else:
		print("dont have enough mana")
	

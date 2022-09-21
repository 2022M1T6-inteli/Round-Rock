extends Button

onready var transparencyGrandient = 0
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

#func that enable the user to press the decline button at any time to move bac the card to it`'s original position
func _on_declineButtom_pressed():
	get_parent().clicked = false
	GlobalCards.oneCardOnly = false
	get_parent().buttons()

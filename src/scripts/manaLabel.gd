extends Label


func _ready():
	pass 


func _physics_process(delta):
	text = str(GlobalBattle.heroActualMana) + "/" + str(GlobalBattle.heroTotalMana)

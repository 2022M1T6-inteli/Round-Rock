extends Label

func _ready():
	text = ""

func showNextEnemyAttack(value):
	if GlobalBattle.enemyData > 0:
		GlobalBattle.enemyData += value
	else:
		GlobalBattle.enemyData = value
		text = "Enemy Attacks:\n"
	for i in range(GlobalBattle.enemyData):#GlobalBattle.enemyData):
			text += get_parent().get_node(GlobalBattle.enemyName).listAttack[i].nome + "\n"

func decreaseNextEnemyAttack():
	if GlobalBattle.enemyData > 1:
		GlobalBattle.enemyData -= 1
		text = "Enemy Attacks:\n"
		for i in range(GlobalBattle.enemyData):#GlobalBattle.enemyData):
				text += get_parent().get_node(GlobalBattle.enemyName).listAttack[i].nome + "\n"
	else:
		text = ""

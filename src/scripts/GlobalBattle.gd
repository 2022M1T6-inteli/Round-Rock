extends Node2D


#enemy variables
var enemyName = ""
var enemyDamage = 0 #this is damage of enemy attack
var enemyShield = 0
var enemyLife = 100
var enemyData = 0
var enemyAlive = true

#hero's variables
var heroLife = 100
var heroShield = 0
var heroDamage = 0
var heroTotalMana = 0
var heroActualMana = 0
var heroMultiply = 1
var heroDamagePlus = 0
var heroPlus = 0
var heroUserKpi = false
var catacombs = false
var sanctuary = false

var showNextCards = 0

var cantClick = false

var camera = null

var noDeployment = false

func reset():
	enemyDamage = 0 #this is damage of enemy attack
	enemyName = ""
	enemyLife = 100
	enemyData = 0
	enemyAlive = true
	enemyShield = 0

	#hero's variables
	heroLife = 100
	heroShield = 0
	heroDamage = 0
	heroTotalMana = 0
	heroActualMana = 0
	heroMultiply = 1
	heroDamagePlus = 0
	heroPlus = 0
	heroUserKpi = false

	showNextCards = 0

	cantClick = false

	noDeployment = false

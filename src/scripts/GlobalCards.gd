extends Node

#[Tipo, Custo, Imagem, Nome, Descrição, Dano, Shield, Scry, data, plus, damage, heal, multiply]

#Knowing the type of the card, it's already known if the card do damage, cure, etc

#business: {"type":"business", "cost":1, "name":"Basic Attack", "description":"1 de dano", "damage":1, "shield":0}
#vision: {"type":"vision", "cost":1, "name":"Minor Healing", "description":"1 de cura", "heal":1} VERIFICAR
#data: {"type":"data", "cost":8, "name":"The Library", "description":"See your next cards", "data":1, "scry":0}VERIFICAR
#quality: {"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
#deployment: {"type":"deployment", "cost":0, "name":"Mana"}
var cardDic = [
	#deployment
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	#data
	{"type":"data", "cost":9, "name":"Sight", "description":"Pelo resto do jogo, sempre saiba o próximo +1 ataque do inimigo", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":1, "name":"Foreshadowing", "description":"Durante esse round, veja o próximo ataque do oponente", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":5, "name":"Revelations", "description":"Veja os próximos 5 ataques do oponente", "dataCards":0, "dataEnemy":5},
	{"type":"data", "cost":3, "name":"The Library", "description":"Veja as próximas 5 cartas do Deck", "dataCards":5, "dataEnemy":0},
	{"type":"data", "cost":9, "name":"Pseudo-omniscience", "description":"Pelo resto do jogo, sempre saiba sua próxima +1 carta", "dataCards":1, "dataEnemy":0},
	#business
	{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 6 de dano", "damage":6, "shield":0},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 6 de dano", "damage":6, "shield":0},
	{"type":"business", "cost":5, "name":"Great Weapons Fighting", "description":"Dano com armas pesadas, 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":9, "name":"Raw Damage", "description":"Pura força bruta, cause 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":2, "name":"Defense", "description":"Use seu escudo e ganhe +3 de defesa", "damage":0, "shield":3},
	{"type":"business", "cost":5, "name":"Warriors Armor", "description":"Use sua armadura e ganhe +6 de defesa", "damage":0, "shield":6},
	{"type":"business", "cost":10, "name":"Shield Wall", "description":"Invoque uma parede de escudos e ganhe +15 de defesa", "damage":0, "shield":15},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 6 de dano", "damage":6, "shield":0},
	{"type":"business", "cost":5, "name":"Great Weapons Fighting", "description":"Dano com armas pesadas, 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":9, "name":"Raw Damage", "description":"Pura força bruta, cause 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 6 de dano", "damage":6, "shield":0},
	{"type":"business", "cost":5, "name":"Great Weapons Fighting", "description":"Dano com armas pesadas, 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":9, "name":"Raw Damage", "description":"Pura força bruta, cause 12 de dano", "damage":12, "shield":0},
	#vision:
	{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Cure 12 de vida", "heal":12, "plus":0},
	{"type":"vision", "cost":15, "name":"Devine Smite", "description":"Seu deus te da forças para o proximo ataque, some mais 10 ao seu próximo ataque", "heal":0, "plus":10},
	{"type":"vision", "cost":20, "name":"Devine health", "description":"Seu deus te da forças para recuperar toda a sua vida", "heal":100, "plus":0},
	{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Cure 2 de vida", "heal":2, "plus":0},
	{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Cure 12 de vida", "heal":12, "plus":0},
	{"type":"vision", "cost":15, "name":"Devine Smite", "description":"Seu deus te da forças para o proximo ataque, some mais 10 ao seu próximo ataque", "heal":0, "plus":10},
	{"type":"vision", "cost":20, "name":"Devine health", "description":"Seu deus te da forças para recuperar toda a sua vida", "heal":100, "plus":0},
	{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Cure 2 de vida", "heal":2, "plus":0},
		#quality
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
]	

var cardDic2 = [
	#deployment
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
	#data
	{"type":"data", "cost":9, "name":"Sight", "description":"Pelo resto do jogo, sempre saiba o próximo +1 ataque do inimigo", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":1, "name":"Foreshadowing", "description":"Durante esse round, veja o próximo ataque do oponente", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":5, "name":"Revelations", "description":"Veja os próximos 5 ataques do oponente", "dataCards":0, "dataEnemy":5},
	{"type":"data", "cost":3, "name":"The Library", "description":"Veja as próximas 5 cartas do Deck", "dataCards":5, "dataEnemy":0},
	{"type":"data", "cost":9, "name":"Pseudo-omniscience", "description":"Pelo resto do jogo, sempre saiba sua próxima +1 carta", "dataCards":1, "dataEnemy":0},
	#business
	{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 6 de dano", "damage":6, "shield":0},
	{"type":"business", "cost":5, "name":"Great Weapons Fighting", "description":"Dano com armas pesadas, 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":9, "name":"Raw Damage", "description":"Pura força bruta, cause 12 de dano", "damage":12, "shield":0},
	{"type":"business", "cost":2, "name":"Defense", "description":"Use seu escudo e ganhe +3 de defesa", "damage":0, "shield":3},
	{"type":"business", "cost":5, "name":"Warriors Armor", "description":"Use sua armadura e ganhe +6 de defesa", "damage":0, "shield":6},
	{"type":"business", "cost":10, "name":"Shield Wall", "description":"Invoque uma parede de escudos e ganhe +15 de defesa", "damage":0, "shield":15},
	#vision:
	{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Cure 12 de vida", "heal":12, "plus":0},
	{"type":"vision", "cost":15, "name":"Devine Smite", "description":"Seu deus te da forças para o proximo ataque, some mais 10 ao seu próximo ataque", "heal":0, "plus":10},
	{"type":"vision", "cost":20, "name":"Devine health", "description":"Seu deus te da forças para recuperar toda a sua vida", "heal":100, "plus":0},
	{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Cure 2 de vida", "heal":2, "plus":0},
	#quality
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0}
]

#variable that guarantee that only one  cards will be used at time
var oneCardOnly = false


var drawCards = false
var nextCard = 0
var untilCard = 7
var noMoreCards = false

var positionCard = []

var waitCardExtinguish = false

func reset():
	drawCards = false
	nextCard = 0
	untilCard = 7
	noMoreCards = false

	positionCard = []

	waitCardExtinguish = false










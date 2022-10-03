extends Node

#Used to define which dimensions buton has been clicked
var dimension = ""

var oneCardOnly = false
# Your cuurrent deck, with the cards in the form of objects
var deck = []
# A list of the cards you own. Each in the format of a dictionary
var ownedCards = [
	{"testImage":"teste1", "type":"business", "cost":1, "name":"Basic Attack", "description":"1 de dano", "damage":1, "shield":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste2", "type":"vision", "cost":2, "name":"Minor Healing", "description":"1 de cura", "heal":1, "plus":0},
	{"testImage":"teste3" ,"type":"data", "cost":5, "name":"The Library", "description":"See your next cards", "data":1, "scry":0},
	{"testImage":"teste4", "type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next cad", "multiply":2, "plus":0},
	{"testImage":"teste1", "type":"deployment", "cost":3, "name":"Mana", "description":"The creation procress"}
	]

# Your deck, but the cards are in dictionary format. Useful for exchanging between the deck selection screen model of card and the battle model of card
var deckDictionary = []

# These two are used for alternating between Dimensions and Cards scenes
var returnToDimensions = false
var goToCards = false
var clearDimensions = false
var goToInfo = false
var goToInfoSelection = false
var sceneToReturnTo = ""


#Texts explaining the dimension
var dimensionTexts = {
	"Vision":"O(A) jogador(a) deve manter seus objetivos em mente. As cartas de visão o(a) permite se curar e sempre lembrar dos seus objetivos, dando-lhe a força necessária para continuar lutando. No Modelo de Produto do mundo real, a Visão é uma declaração de intenção indicando o que uma empresa, unidade de negócios ou equipe quer se tornar e orientando iniciativas de transformação, definindo uma direção definida para o crescimento futuro.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não tem conhecimento ou não possui uma visão de produto;\nSe encontra no nível 2 quando está ciente de sua visão de produto e acredita que ela reflete o objetivo de seu trabalho;\n\nAEstá no nível 3 quando usa a visão do produto para moldar as decisões do produto;\n\nAAtinge o nível 4 quando a equipe está apoiada por um Conselho de Crescimento, ou seja, alavanca continuamente a linha de produtos, compartilha oportunidades ou resultados de experimentos e continua a aproveitar os dados para demonstrar e gerar valor.",
	"Data Driven":"O(A) jogador(a) deve levar em consideração as informações disponíveis, isso significa ser orientado(a) por dados. Por isso, cartões de orientação de dados fornecem dados sobre a batalha. Seja em relação às próximas cartas do deck ou aos seguintes ataques inimigos. No Modelo de Produto do mundo real, a Orientação de Dados é pelo progresso atual e futuro do estado do produto com base em dados convincentes, e não por intuição ou experiência pessoal.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não acompanha os KPIs em mudança;\n\nSe encontra no nível 2 quando acompanha as métricas de sucesso do usuário e do negócio ao longo do tempo e os valores dessas métricas são atualizados pelo menos uma vez por trimestre;\n\nEstá no nível 3 quando acompanha as métricas de sucesso do usuário e do negócio ao longo do tempo e os valores dessas métricas são atualizados pelo menos uma vez por ciclo de negócios (a meta é entre 1 semana e 1 mês);\n\nAtinge o nível 4 quando a equipe acompanha o sucesso de métricas do usuário e do negócio. Faz alterações no backlog, visão, roteiro e decisões das partes interessadas do negócio."
}

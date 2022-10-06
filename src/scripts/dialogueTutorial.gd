extends Control

var dialogueInit = []
var dialogueMid = []
var dialogueEnd = []
var dialogue_list = 0
var end = false
var preBattle = true
var posBattle = false

var index = 1

var teach = [
		[
			"VAMOS COMEÇAR O TUTORIAL!!!",
			"Como você pode ver, todas as cartas possuem um custo, chamado de pontos de deployment, localizado em sua ponta superior esquerda. Os seus pontos de Deployment estão indicado entre a sua vida e a vida do inimigo, dentro de um brasão de ouro, indicando 0/0.",
			"Para você conseguir mais pontos de deployment deve usar as cartas de Deployment, em roxo. Elas são as únicas cartas que não possuem nenhum custo.",
			"Deployment KPI's estão relacionados com a capacidade de fazer com que suas criações ganhem vida, ou seja, sempre os mantenha atualizado, eles irão garantir seu progresso.",
			"Agora, utilize a carta de Deployment e passe o Round!!!"
		],
		[
			"Perfeito!!!",
			"Como você bem percebeu, ao passar o turno seu inimigo o atacou. Tome cuidado ou você irá perder!",
			"Toda vez que você passar o round os espaços vazios das cartas usadas serão preenchidos por novas cartas do seu deck. O seus pontos de deployment também serão resetados para a quantidade de cartas de deployment que você utilizou durante toda a partida.",
			"Vamos entender como as outras cartas do jogo funcionam!!!",
			"As cartas em vermelho são as de Business, elas estão relacionado as sua capacidade de dar dano como também se defender. O objetivo de todo negócio é triunfar, não se esqueça disso!",
			"Experimente utilizar uma e passe o round."
		],
		[
			"Você é realmente bom!!!",
			"Agora iremos utilizar uma carta azul-escura! Essas são as cartas de Data-driven, as quais permitem você ter mais dados sobre suas próximas cartas, como também das ações de seu inimigo.",
			"Use as com sabedoria!!! Elas irão te ajudar a tomar melhores decisões no decorrer do jogo.",
			"A utilize e passe o round."
		],
		[
			"Uhull!! Você leva jeito para isso!",
			"Agora iremos falar um pouco mais sobre visão. Você é o recpetáculo do Deus da Criação, seus poderes passam por suas veias. Mas para isso realmente acontecer você primeiramente precisa ter uma visão clara.",
			"Seu objetivo é salvar a terra dos mundos distantes, CastleDell, seu povo. Isso te dá a capacidade realizar magias, sejam elas de cura, como também de invocar a fúria de seu Deus na batalha.",
			"Você já perdeu um pouco de vida, que tal utilizar uma criação de cura?",
			"Faça isso e depois passe o turno"
		],
		[
			"Vamos falar um pouco sobre as cartas em amarelo, as cartas de Quality KPI's.",
			"Uma das cartas mais poderosas do seu baralho, ela tem a capacidade de somar ou multiplicar sua próxima ação.",
			"Sempre tenha em mente que seus produtos nunca serão perfeitos e sempre poderão ser melhorados.",
			"Por último, vamos falar sobre USER KPI!!!!",
			"Durante a batalha, caso você faça uma jogada sofisticada, ou seja, usar mais de 3 cartas em uma rodada, seu deus, o indivíduo a quem você está contruindo um produto, ficará satisfeito.",
			"Sua satisfação sobe como também a barra que fica logo a baixo da sua vida. Ao completá-la, seu Deus irá lhe ajudar em sua próxima ação. NUNCA ESQUEÇA DISSO!!!!",
			"Agora você está por conta!",
			"Aprenda, melhore e colete os fragmentos. CastleDell precisa de você!!!!!!"
		]
	]

func _ready():
	addDialog1()
	load_dialogue()

func _process(_delta):
	if Input.is_action_just_pressed("Next"):
		if preBattle:
			load_dialogue()
		elif posBattle:
			load_dialogueEnd()
		else:
			load_dialogueMid()

func addDialog1():
	if Global.language == 1:
		match get_tree().current_scene.name:
			"motherLandBattle":
				dialogueInit = GlobalTexts.dialogueMLB_pt
				#dialogueEnd = GlobalTexts.dialogueCH
	if Global.language == 0:
		match get_tree().current_scene.name:
			"motherLandBattle":
				dialogueInit = GlobalTexts.dialogueMLB_en
	
	set_process(true)


func addDialog(listaDialogos):
	dialogueMid = listaDialogos
	dialogue_list = 0
	set_process(true)
	load_dialogueMid()

func load_dialogue():
	preBattle = true
	if dialogue_list < dialogueInit.size(): 
		end = false

		$CaixaDeDialogo/RichTextLabel.bbcode_text = dialogueInit[dialogue_list]
		$CaixaDeDialogo/RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property( 
			$CaixaDeDialogo/RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		self.visible = false
	
	
	if dialogue_list == dialogueInit.size(): 
		get_parent().showDeck(0, 7)
		preBattle = false
		dialogue_list = 0
		set_process(false)
		addDialog(teach[0])
	dialogue_list += 1
	
func load_dialogueEnd():
	visible = true
	posBattle = true
	if dialogue_list < dialogueEnd.size(): 
		end = false

		$CaixaDeDialogo/RichTextLabel.bbcode_text = dialogueEnd[dialogue_list]
		$CaixaDeDialogo/RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property( 
			$CaixaDeDialogo/RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		
	if dialogue_list == dialogueEnd.size():
		GlobalTexts.endDialogue = true
		print(GlobalTexts.endDialogue)
		posBattle = false
		visible = false
		dialogue_list = 0
	
	dialogue_list += 1
		
func load_dialogueMid():
	visible = true
	if dialogue_list < dialogueMid.size(): 
		end = false

		$CaixaDeDialogo/RichTextLabel.bbcode_text = dialogueMid[dialogue_list]
		$CaixaDeDialogo/RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property( 
			$CaixaDeDialogo/RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		self.visible = false
		get_parent().get_node("TextureButton").visible = true
	
	
	if dialogue_list == dialogueInit.size(): 
		visible = false
		dialogue_list = 0
		set_process(false)
		
	dialogue_list += 1

func _on_Tween_tween_completed(_object, _key):
	end = true


func _on_TextureButton_pressed():
	if len(teach) > index:
		addDialog(teach[index])
		get_parent().get_node("TextureButton").visible = false
		index += 1

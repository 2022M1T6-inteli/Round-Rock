extends Control

var dialogue_list = 0
var end = false
var dialogue


func _ready():
	if Global.language == 1:
		dialogue = [
			'Delliot: Por que estou sonhando com isso? Todos os dias, os mesmos sonhos, os mesmos monstros, Kurgath … CastleDell. O que é isso?',
			'Delliot: A vida já é difícil o suficiente tentando sobreviver nesse lugar. Encontrar alimentos, recursos, cuidar do meu povo, e agora … SONHOS!!!',
			'God: Se acalme, garoto',
			'Delliot: Quem é você? Mostre-se, demônio!',
			'God: Não tenha medo garoto, pois eu sou o um e único.  Alguns me chamam Destruição, muitos de Transformação, por todos de Criação',
			'God: Venho tentando me comunicar com você, meu descendente, sangue do meu sangue. Me ajude a coletar os fragmentos da minha relíquia, com isso, seu mundo, seu reino, de novo estará a salvo.',
			'Delliot: Desculpe Criação, como posso te ajudar?',
			'God: Acabei de abrir um portal. Entre nele, e daí eu te oriento'
			] 

	if Global.language == 0:
		dialogue = [
			'Delliot: Why am I dreaming about this? Everyday, the same dreams, the same monsters, Kurgath … CastleDell. What is this?',
			'Delliot: Life is already hard enough trying to survive in this place. Finding food, resources, taking care of my people, and now... DREAMS!!!',
			'God: Kid, calm down',
			'Delliot: Who are you? Show yourself, demon!',
			'God: Do not be afraid kid, as I am the one and only. Some call me destruction, others Transformation, for all of Creation',
			'God: I have been trying to reach you, my descendant, blood of my blood. Help me to collect the fragments of my relic, with that, your world, your kingdom, will be safe once again',
			'Delliot: I am sorry Creation, how can I help?',
			'God: I have unlocked a portal, enter it, and from there I will guide you'
			] 
	load_dialogue()

func _process(delta):
	if self.visible:
		if Input.is_action_just_pressed("Next"):
			load_dialogue()

func load_dialogue():
	if dialogue_list < dialogue.size(): 
		end = false
		$RichTextLabel.bbcode_text = dialogue[dialogue_list]
		$RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property( 
			$RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		self.visible = false
	dialogue_list += 1

	if dialogue_list > 8: 
		get_parent().get_parent().get_node("Player").set_physics_process(true)
		Global.visible_portal=true

func _on_Tween_tween_completed(object, key):
	end = true

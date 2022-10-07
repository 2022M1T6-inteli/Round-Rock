extends Control

var dialogueInit = []
var dialogueEnd = []
var dialogue_list = 0
var end = false
var preBattle = false
var posBattle = false

func _ready():
	#addDialog(GlobalTexts.dialogueMLB)
	addDialog1()
	load_dialogue()
	GlobalTexts.endDialogue = false
	GlobalTexts.dialogueStart = true

func _process(_delta):
	if Input.is_action_just_pressed("Next"):
		print("apertei espaço")
		if preBattle:
			load_dialogue()
		elif posBattle:
			print("oi")
			load_dialogueEnd()

#identify wich dialogue must be used
func addDialog1():
	if Global.language == 1:
		match get_tree().current_scene.name: 
			"DarkLightBattle":
				dialogueInit = GlobalTexts.dialogueDLFB_pt
				dialogueEnd = GlobalTexts.dialogueDLFBEnd_pt
		
			"CatacombsBattle":
				dialogueInit = GlobalTexts.dialogueCATB_pt
				dialogueEnd = GlobalTexts.dialogueCATBEnd_pt
			
			"CemeteryBattle": 
				dialogueInit = GlobalTexts.dialogueCEMB_pt
				dialogueEnd = GlobalTexts.dialogueCEMBEnd_pt
			
			"ChurchBattle":
				dialogueInit = GlobalTexts.dialogueCH_pt
				dialogueEnd = GlobalTexts.dialogueCH_pt
			
			"FortBattle":
				dialogueInit = GlobalTexts.dialogueFOIB_pt
				dialogueEnd = GlobalTexts.dialogueFOIEnd_pt

			"HallsOfStoneBattle":
				dialogueInit = GlobalTexts.dialogueHOSB_pt
				dialogueEnd = GlobalTexts.dialogueHOSBEnd_pt
		
			"HomeLandBattle":
				dialogueInit = GlobalTexts.dialogueHLB_pt
#				dialogueEnd = GlobalTexts.dialogueHLBEnd_pt

			"FinalBattle":
				dialogueInit = GlobalTexts.dialogueFinalB_pt
				dialogueEnd = GlobalTexts.dialogueFinalBEnd_pt

	if Global.language == 0:
		match get_tree().current_scene.name: 
			"DarkLightBattle":
				dialogueInit = GlobalTexts.dialogueDLFB_en
				dialogueEnd = GlobalTexts.dialogueDLFBEnd_en
				
			"CatacombsBattle":
				dialogueInit = GlobalTexts.dialogueCATB_en
				dialogueEnd = GlobalTexts.dialogueCATBEnd_en
				
			"CemeteryBattle": 
				dialogueInit = GlobalTexts.dialogueCEMB_en
				dialogueEnd = GlobalTexts.dialogueCEMBEnd_en
				
			"ChurchBattle":
				dialogueInit = GlobalTexts.dialogueCH_en
				dialogueEnd = GlobalTexts.dialogueCH_en
				
			"FortBattle":
				dialogueInit = GlobalTexts.dialogueFOIB_en
				dialogueEnd = GlobalTexts.dialogueFOIEnd_en

			"HallsOfStoneBattle":
				dialogueInit = GlobalTexts.dialogueHOSB_en
				dialogueEnd = GlobalTexts.dialogueHOSBEnd_en
			
			"HomeLandBattle":
				dialogueInit = GlobalTexts.dialogueHLB_en
				#dialogueEnd = GlobalTexts.dialogueHLBEnd_en

			"FinalBattle":
				dialogueInit = GlobalTexts.dialogueFinalB_en
				dialogueEnd = GlobalTexts.dialogueFinalBEnd_en
	set_process(true)

#add a choosen dialogue
func addDialog(listaDialogos):
	dialogueInit = listaDialogos
	dialogue_list = 0
	set_process(true)

#load dialogue and show it
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
	
	print("antes cart:",dialogue_list)
	if dialogue_list == dialogueInit.size(): 
		get_parent().showDeck(0, 7)
		print("DEPOIS cart:",dialogue_list)
		preBattle = false
		dialogue_list = 0
		set_process(false)
	dialogue_list += 1
	
#load other dialogue
func load_dialogueEnd():
	set_process(true)
	
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
		print(GlobalTexts.endDialogue)
		posBattle = false
		visible = false
		dialogue_list = 0
		GlobalTexts.dialogueStart = false
		GlobalTexts.endDialogue = true

	dialogue_list += 1
	
	
	
func _on_Tween_tween_completed(_object, _key):
	end = true

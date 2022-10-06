extends Control

var dialogue = [] 
var dialogue_list = 0
var end = false

func _ready():
	pass

func _process(_delta):
	if GlobalTexts.dialogueStart == true:
		self.visible = true
		addDialogP()
		load_dialogue()
		GlobalTexts.dialogueStart = false
		
	if Input.is_action_just_pressed("Next"):
		load_dialogue()

func addDialogP():
	match get_tree().current_scene.name: 
		"DarkLightForest":
			dialogue = GlobalTexts.dialogueDLF_pt
		
		"CatacombsOfAnnihilation":
			dialogue = GlobalTexts.dialogueCAT_pt
			
		"Cemetery":
			dialogue = GlobalTexts.dialogueCEM_pt
		
		"Church":
			dialogue = GlobalTexts.dialogueCH_pt
		
		"FortOfIllusion":
			dialogue = GlobalTexts.dialogueFOI_pt
		
		"HallsOfStone":
			dialogue = GlobalTexts.dialogueHOS_pt
		
		"HomeLand": 
			dialogue = GlobalTexts.dialogueHL_pt
		
		"Final":
			dialogue = GlobalTexts.dialogueFinal_pt

	if Global.language == 0:
			match get_tree().current_scene.name: 
				"DarkLightForest":
					dialogue = GlobalTexts.dialogueDLF_en
			
				"CatacombsOfAnnihilation":
					dialogue = GlobalTexts.dialogueCAT_en
				
				"Cemetery":
					dialogue = GlobalTexts.dialogueCEM_en
			
				"Church":
					dialogue = GlobalTexts.dialogueCH_en
			
				"FortOfIllusion":
					dialogue = GlobalTexts.dialogueFOI_en
				
				"HallsOfStone":
					dialogue = GlobalTexts.dialogueHOS_en
				
				"HomeLand":
					dialogue = GlobalTexts.dialogueHL_en
				
				"Final":
					dialogue = GlobalTexts.dialogueFinal_en

func load_dialogue():
	if dialogue_list < dialogue.size(): 
		end = false
		$CaixaDeDialogo/RichTextLabel.bbcode_text = dialogue[dialogue_list]
		$CaixaDeDialogo/RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property( 
			$CaixaDeDialogo/RichTextLabel, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		self.visible = false
	dialogue_list += 1
	
	if dialogue_list == dialogue.size():
		Global.visible_portal=true
		
func _on_Tween_tween_completed(_object, _key):
	end = true

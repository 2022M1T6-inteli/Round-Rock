extends Control

var dialogue = [
	'Margareth: Oh, you must be Delliot! I´ve been waiting for you, my name is princess Margaret, first of her name, ruler of the amazons and bringer of vision',
	'Delliot:  I´ve been told you have something for me',
	'Margaret: Yes, but before I give it to you, you must prove that you are worthy of the Supreme Heal',
	'Elliot: Supreme Heal? What is that?',
	'Margaret: The Supreme Heal is an ability only few are able to master',
	'Margareth: It allows you to recover your entire health but once you use the Supreme Heal card, you lose all of your vision cards, so you must use it wisely',
	'Margareth: Here, take it',
	'Margareth: You must now pass through a passage that has been unlocked, I hope you succeed. For the sake of us all…'
	] 
	
var dialogue_list = 0
var end = false

func _ready():
	load_dialogue()

func _process(_delta):
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
		Global.visible_portal=true
		
func _on_Tween_tween_completed(_object, _key):
	end = true

extends Control

func _on_backButton_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/MainMenu.tscn")


func _on_GoToMotherLand_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/MotherLand.tscn")

func _on_GoToMotherLand_mouse_entered():
		$SelectSound.play()


func _on_GoToDarkLightForest_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/DarkLightForest.tscn")
	pass # Replace with function body.

func _on_GoToDarkLightForest_mouse_entered():
	$SelectSound.play()


func _on_GoToCatacombsOfAnihilation_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/CatacombsOfAnnihilation.tscn")
	pass # Replace with function body.

func _on_GoToCatacombsOfAnihilation_mouse_entered():
	$SelectSound.play()


func _on_GoToUnholyCemetery_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/Cemetery.tscn")
	pass # Replace with function body.

func _on_GoToUnholyCemetery_mouse_entered():
	$SelectSound.play()


func _on_GoToChurchOfTheDamned_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/Church.tscn")
	pass # Replace with function body.

func _on_GoToChurchOfTheDamned_mouse_entered():
	$SelectSound.play()


func _on_GoToFortOfIllusion_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/FortOfIllusion.tscn")
	pass # Replace with function body.

func _on_GoToFortOfIllusion_mouse_entered():
	$SelectSound.play()


func _on_GoToHallsOfStone_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/HallsOfStone.tscn")
	pass # Replace with function body.

func _on_GoToHallsOfStone_mouse_entered():
	$SelectSound.play()


func _on_GoToHomeLand_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/HomeLand.tscn")
	pass # Replace with function body.

func _on_GoToHomeLand_mouse_entered():
	$SelectSound.play()


func _on_GoToFinal_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/Final.tscn")
	pass # Replace with function body.

func _on_GoToFinal_mouse_entered():
	$SelectSound.play()

extends Label




func _physics_process(delta):
	text = str(GlobalBattle.heroActualMana) + "/" + str(GlobalBattle.heroTotalMana)

func noMana():
	$Tween.interpolate_property(self, "self_modulate", self_modulate, Color(9.51,1.1,1,1),0.5, Tween.TRANS_BOUNCE)
	$Tween.start()
	yield(get_tree().create_timer(1), "timeout")
	$Tween.interpolate_property(self, "self_modulate", self_modulate, Color(1,1,1,1),0.5, Tween.TRANS_BOUNCE)
	$Tween.start()

extends Control

var visibleShield = false
var userKpiValue = 0

func _physics_process(delta):
	showShield(delta)

func _ready():
	$HealthBar.value = 100
	$shield.modulate.a = 0
	$userKpi.value = 0

#decrease hero health and shield when recive damage
func decreaseLife(value):
	if GlobalBattle.heroShield > 0:
		if GlobalBattle.heroShield - value < 0:
			visibleShield = false
			var subtract = GlobalBattle.heroShield - value
			GlobalBattle.heroLife = $HealthBar.value + subtract
			get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.heroLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			get_node("HealthBar/Tween").start()
			GlobalBattle.heroShield = 0
		else:
			GlobalBattle.heroShield -= value
	else:
		GlobalBattle.heroLife = $HealthBar.value - value
		get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.heroLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		get_node("HealthBar/Tween").start()
	$shield/Label.text = str(GlobalBattle.heroShield)


func increaseLife(value):
	GlobalBattle.heroLife = $HealthBar.value + value
	if GlobalBattle.heroLife > 100: GlobalBattle.heroLife = 100
	get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.heroLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	get_node("HealthBar/Tween").start()

func increaseShield(value):
	GlobalBattle.heroShield += value
	$shield/Label.text = str(GlobalBattle.heroShield)
	visibleShield = true
	
func showShield(delta):
	if visibleShield:
		if $shield.modulate.a8 == 255:
			$shield.modulate.a = 1
		else:
			$shield.modulate.a = lerp($shield.modulate.a, 1, delta)
	else:
		if $shield.modulate.a8 == 0:
			$shield.modulate.a = 0
		else:
			$shield.modulate.a = lerp($shield.modulate.a, 0, delta)

func userKpi():
	if GlobalBattle.showNextCards >= 3:
		userKpiValue += 5
		if userKpiValue <= 15:
			get_node("userKpi/Tween").interpolate_property($userKpi, "value", $userKpi.value, userKpiValue, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			get_node("userKpi/Tween").start()
			if userKpiValue == 15:
				GlobalBattle.heroUserKpi = true
				
func decreaseUserKpi():
		get_node("userKpi/Tween").interpolate_property($userKpi, "value", $userKpi.value, 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		get_node("userKpi/Tween").start()
		GlobalBattle.heroUserKpi = false

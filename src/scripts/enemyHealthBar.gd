extends Control

var visibleShield = false

func _physics_process(delta):
	showShield(delta)

func _ready():
	$HealthBar.value = 100
	$shield.modulate.a = 0

func decreaseLife(value):
	if GlobalBattle.enemyShield > 0:
		if GlobalBattle.enemyShield - value < 0:
			visibleShield = false
			var subtract = GlobalBattle.enemyShield - value
			GlobalBattle.enemyLife = $HealthBar.value + subtract
			get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.enemyLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			get_node("HealthBar/Tween").start()
			GlobalBattle.enemyShield = 0
		else:
			GlobalBattle.enemyShield -= value
	else:
		GlobalBattle.enemyLife = $HealthBar.value - value
		get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.enemyLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		get_node("HealthBar/Tween").start()
	$shield/Label.text = str(GlobalBattle.enemyShield)

func increaseLife(value):
	GlobalBattle.enemyLife = $HealthBar.value - value
	if GlobalBattle.enemyLife > 100: GlobalBattle.enemyLife = 100
	get_node("HealthBar/Tween").interpolate_property($HealthBar, "value", $HealthBar.value, GlobalBattle.enemyLife, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	get_node("HealthBar/Tween").start()

func increaseShield(value):
	GlobalBattle.enemyShield += value
	$shield/Label.text = str(GlobalBattle.enemyShield)
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

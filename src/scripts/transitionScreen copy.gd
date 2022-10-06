extends CanvasLayer

onready var animation = $AnimationPlayer
var sceneToGo = ""
var sceneToDie = ""

func FadeInto(scene):
	sceneToGo = scene
	animation.play("Fade")

func ChangeScene():
	get_tree().change_scene(sceneToGo)

func ChangeDie():
	get_tree().change_scene(sceneToDie)

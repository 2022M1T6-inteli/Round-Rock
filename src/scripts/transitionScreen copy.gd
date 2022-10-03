extends CanvasLayer

onready var animation = $AnimationPlayer
var sceneToGo = ""

func FadeInto(scene):
	sceneToGo = scene
	animation.play("Fade")

func ChangeScene():
	get_tree().change_scene(sceneToGo)

extends CanvasLayer

onready var _pause_menu = $PauseMenu

func _ready():
	_pause_menu.close()

func _physics_process(delta):
	if _pause_menu.is_visible_in_tree():
		$PauseButton.visible = false
	else:
		$PauseButton.visible = true

func _input(event):
	if $PauseButton.pressed:
		$SoundButton.play()
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()

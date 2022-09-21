extends Area2D

#export(PackedScene) var target_scene
export(PackedScene) var target_scene

func _process(_delta):
	self.visible = Global.visible_portal

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if self.visible:
			if !target_scene: # is null
				print("no scene in this portal")
				return
			if get_overlapping_bodies().size() > 0:
				next_level()
				Global.visible_portal = false

func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	
	if ERR != OK:
		print("something failed in the portal scene")

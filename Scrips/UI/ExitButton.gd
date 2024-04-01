extends CanvasLayer

var isOn = false

func _on_touch_screen_button_pressed():
	if isOn == false:
		$Panel.visible = true
		isOn = true
	else:
		$Panel.visible = false
		isOn = false

func _on_touch_screen_button_2_pressed():
	isOn = false
	$Panel.visible = false


func ExitButton():
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
	$Panel.visible = false
	isOn = false

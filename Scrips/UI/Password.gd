extends Label

var result = "111111"

func key_press(digit):
	if len(text) < 6:
		self.text += digit

func PressedOne():
	key_press("1")

func PressedOK():
	if text == result:
		text = "CORRECT"
		GameData.gameDataRes.is_incinerator_password_correct = true
		get_tree().change_scene_to_file("res://Scene/SavePoint2/Incinerator2.tscn")
	else:
		text = ""

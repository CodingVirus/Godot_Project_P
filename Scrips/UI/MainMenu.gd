extends Control

@export_file var cutScene : String

var gameData = null

func _ready():
	UImanager.UIOff()

func _on_touch_screen_button_pressed():
	if (GameData.gameDataRes.is_first_start == EnumData.GameState.FIRST_START):
		$VBoxContainer.visible = false
		UImanager.get_node("FadeInOut").Play()
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file(cutScene)
	else:
		get_tree().change_scene_to_file(GameData.gameDataRes.save_scene_path)


func _on_touch_screen_button_2_pressed():
	get_tree().quit()

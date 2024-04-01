extends Node2D

func _ready():
	UImanager.UIOff()

func _on_touch_screen_button_pressed():
	GameData.gameDataRes.is_fix_generator = true
	get_tree().change_scene_to_file("res://Scene/Level/Level1.tscn")


func _on_touch_screen_button_2_pressed():
	get_tree().change_scene_to_file("res://Scene/Level/Level1.tscn")

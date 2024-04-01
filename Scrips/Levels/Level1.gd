extends Node2D

func _ready():
	UImanager.UIOn()
	if get_tree().current_scene.name == "Level1":
		
		#UImanager.get_node("Inventory").DeleteItem(1)
		#UImanager.get_node("Inventory").DeleteItem(2)
		
		
		#var game_data = GameData.gameDataRes
		#game_data.is_accept_cluey_quest_second = false
		#game_data.is_clear_cluey_quest_second = false
		#game_data.is_use_computer = false
		
		GameData.gameDataRes.is_first_start = EnumData.GameState.START
		GameData.Save(get_tree().current_scene.scene_file_path)

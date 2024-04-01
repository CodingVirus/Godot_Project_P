extends Node2D

func _ready():
	
	UImanager.UIOn()
	
	var game_data = GameData.gameDataRes
	game_data.is_accept_cluey_quest_first = true
	game_data.is_clear_cluey_quest_first = true
	game_data.is_prison_door_open = true
	game_data.is_b3_up_stair_open = true
	game_data.is_level2_clear = true
	game_data.is_accept_cluey_quest_second = true
	game_data.is_clear_cluey_quest_second = true
	
	GameData.gameDataRes.is_first_start = EnumData.GameState.START
	GameData.Save(get_tree().current_scene.scene_file_path)
		


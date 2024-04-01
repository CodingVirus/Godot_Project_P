extends Node2D

func _ready():
	UImanager.UIOn()
	#if get_tree().current_scene.name == "B3surgery":
		
		#UImanager.get_node("Inventory").ClearInven()
		
		#var game_data = GameData.gameDataRes
		#game_data.is_accept_cluey_quest_first = false
		#game_data.is_clear_cluey_quest_first = false
		#game_data.is_prison_door_open = false
		
		#GameData.gameDataRes.is_first_start = EnumData.GameState.START
		#GameData.Save(get_tree().current_scene.scene_file_path)

func _on_prison_key_pressed():
	UImanager.get_node("Inventory").AddItem(EnumData.ItemName.PRISON_KEY)
	$PrisonKey.visible = false
	

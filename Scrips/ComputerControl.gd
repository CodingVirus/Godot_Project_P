extends Control



func _on_start_button_pressed():
	#SceneManager.DelayChangeScene("res://Scene/Level/Level2.tscn", 0.2)
	UImanager.get_node("Inventory").AddItem(EnumData.ItemName.DRUG)
	UImanager.UIOn()
	
	GameData.isPlayerState = EnumData.PlayerState.IDLE
	UImanager.get_node("Computer").visible = false

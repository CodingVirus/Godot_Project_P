extends Control

func _ready():
	UImanager.get_node("Inventory").visible = false
	await get_tree().create_timer(4).timeout
	UImanager.get_node("FadeInOut").Play()
	SceneManager.DelayChangeScene("res://Scene/CutScene/DrinkDrug/WakeUp.tscn",3)

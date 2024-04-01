extends Control

func _ready():
	await get_tree().create_timer(3).timeout
	#DialogueManager.show_dialogue_balloon(load("res://Dialogue/main.dialogue"), "phone_scene")
	UImanager.get_node("FadeInOut").Play()
	SceneManager.DelayChangeScene("res://Scene/LoadingScene/Loading.tscn", 3)


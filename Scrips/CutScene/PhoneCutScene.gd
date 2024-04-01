extends Control

func _ready():
	await get_tree().create_timer(2).timeout
	var dialogueLanguage = GameData.gameDataRes.dialogue_language
	DialogueManager.show_dialogue_balloon(load(dialogueLanguage), "phone_scene")


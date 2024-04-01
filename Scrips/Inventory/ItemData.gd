extends Resource
class_name ItemData

@export var item_name : EnumData.ItemName
@export var item_image : Texture
@export var is_expendable : bool
@export var is_only_one : bool

func Use():
	var dialogueLanguage = GameData.gameDataRes.dialogue_language
	match item_name:
		EnumData.ItemName.COKE:
			if GameData.isDialogueStart == EnumData.DialogueState.END:
				DialogueManager.show_dialogue_balloon(load(dialogueLanguage), "Using_item")
				
		EnumData.ItemName.DRUG:
			print("Use Drug!")
			
		EnumData.ItemName.PRISON_KEY:
			if GameData.isDialogueStart == EnumData.DialogueState.END:
				DialogueManager.show_dialogue_balloon(load(dialogueLanguage), "Using_prison_key")

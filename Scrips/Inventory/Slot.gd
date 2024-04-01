extends Panel

var isEmpty = true
var itemData : ItemData
@onready var itemImage = $Sprite2D

func _on_touch_screen_button_pressed():
	if isEmpty == false && GameData.isDialogueStart == EnumData.DialogueState.END:
		UImanager.get_node("Inventory").currentSlot = self
		itemData.Use()

func Use():
	itemData.Use()
	if itemData.is_expendable:
		isEmpty = true
		itemImage.texture = null
		itemData = null

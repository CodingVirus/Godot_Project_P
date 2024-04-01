extends CanvasLayer

@onready var inven = $GridContainer
var currentSlot : Panel
@export var itemData : InventoryData

func AddItem(number):
	if FindItem(number) && itemData.items[number].is_only_one == true:
		print("")
	else:
		for i in inven.get_child_count():
			var slot = inven.get_child(i)
			if slot.isEmpty == true:
				slot.itemData = itemData.items[number]
				slot.itemImage.texture = itemData.items[number].item_image
				slot.isEmpty = false
				break
			
func UseItem():
	if currentSlot != null:
		currentSlot.Use()

func ClearInven():
	for i in inven.get_child_count():
		var slot = inven.get_child(i)
		slot.isEmpty = true
		slot.itemData = null
		slot.itemImage.texture = null
		
func DeleteItem(itemName):
	for i in inven.get_child_count():
		var slot = inven.get_child(i)
		if slot.isEmpty == false && slot.itemData.item_name == itemName:
			slot.isEmpty = true
			slot.itemData = null
			slot.itemImage.texture = null
			#itemData.items[number].item_name

func FindItem(itemName):
	for i in inven.get_child_count():
		var slot = inven.get_child(i)
		if slot.isEmpty == false && slot.itemData.item_name == itemName:
			return true

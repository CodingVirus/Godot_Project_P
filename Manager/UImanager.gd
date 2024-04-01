extends Node

func UIOff():
	$ExitButton.visible = false
	$Inventory.visible = false
	$MobileController.visible = false
	$Computer.visible = false
	
func UIOn():
	$ExitButton.visible = true
	$Inventory.visible = true
	$MobileController.visible = true


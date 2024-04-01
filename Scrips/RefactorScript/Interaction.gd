extends Area2D

var isWork = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		UImanager.get_node("Notice").visible = true
		isWork = true
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		UImanager.get_node("Notice").visible = false
		isWork = false 
		
func _process(delta):
	var input = Input.is_action_just_pressed("interaction")
	var language = GameData.gameDataRes.dialogue_language
	if isWork && input:
		if GameData.isDialogueStart == EnumData.DialogueState.END:
			match self.name:
				"Doctor":
					doctorDialog(language)
				"Cluey":
					clueyDialog(language)
				"VendingMachine":
					vendingMachineDialog(language)
				"Computer":
					computerDialog(language)
				"Generator":
					generatorDialog(language)
				_:
					pass
		
func doctorDialog(language):
	dialogStart(language, "Doctor_First_Meet")
	UImanager.get_node("Notice").visible = false
	
func clueyDialog(language):
	var checkAcceptQuest = GameData.gameDataRes.is_accept_cluey_quest_second
	var checkClearQuest = GameData.gameDataRes.is_clear_cluey_quest_second
	var findDrug = UImanager.get_node("Inventory").FindItem(EnumData.ItemName.DRUG)
	
	if (checkAcceptQuest && findDrug) || checkClearQuest:
		dialogStart(language, "Goodbye_cluey")
	else:
		dialogStart(language, "Second_meet_cluey")
		
	UImanager.get_node("Notice").visible = false
	
	
func vendingMachineDialog(language):
	dialogStart(language, "Using_vendingmachine")
	UImanager.get_node("Notice").visible = false


func computerDialog(language):
	#dialogStart(language, "Computer")
	UImanager.get_node("Notice").visible = false
	UImanager.get_node("Inventory").visible = false
	UImanager.get_node("MobileController").visible = false
	
	UImanager.get_node("Computer").visible = true
	GameData.isPlayerState = EnumData.PlayerState.STOP
	



func generatorDialog(language):
	var checkQuest = GameData.gameDataRes.is_accept_generator_quest
	var checkIsFix = GameData.gameDataRes.is_fix_generator
		
	if checkQuest == false:
		dialogStart(language, "Generator")
			
	elif checkQuest == true && checkIsFix == false:
		UImanager.get_node("FadeInOut").ShortPlay()
		UImanager.UIOff()
		SceneManager.DelayChangeScene("res://Scene/OutSide/Generator.tscn", 0.5)
		#get_tree().change_scene_to_file("res://Scene/SavePoint1/FixGenerator.tscn")
			
	elif checkIsFix == true:
		dialogStart(language, "GeneratorComplete")
	
	UImanager.get_node("Notice").visible = false



func dialogStart(language, title):
	DialogueManager.show_dialogue_balloon(load(language), title)

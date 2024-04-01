extends Area2D

var isMove = false
var playerPos
@export var nextDoor : Node2D
var anim : AnimationPlayer

func _on_body_entered(body):
	if body.is_in_group("player"):
		isMove = true
		playerPos = body

func _on_body_exited(body):
	if body.is_in_group("player"):
		isMove = false
		playerPos = null
	pass 

func _process(delta):
	
	var input = Input.is_action_just_pressed("interaction")
	var dialogState = GameData.isDialogueStart == EnumData.DialogueState.END
	var language = GameData.gameDataRes.dialogue_language
	
	if isMove && input && dialogState:
		match self.name:
			"PrisonOutDoor":
				prisonDoor(language)
			"MechanicalRoomDoor":
				mechanicalRoomDoor(language)
			"3FStairDoor":
				stairDoor3F(language)
			_:
				movePlayer()
	pass 


func stairDoor3F(language):
	var checkIsOpen = GameData.gameDataRes.is_b3_up_stair_open
	var checkLevelClear = GameData.gameDataRes.is_level2_clear
	var checkItem = UImanager.get_node("Inventory").FindItem(EnumData.ItemName.KEY_3F)
	
	if checkIsOpen && checkLevelClear:
		movePlayer()
	elif checkItem:
		UImanager.get_node("Inventory").DeleteItem(EnumData.ItemName.KEY_3F)
		GameData.gameDataRes.is_b3_up_stair_open = true
		$AnimationPlayer.play("3FUpStairDoorOpen")
	elif checkIsOpen && !checkLevelClear:
		UImanager.get_node("FadeInOut").Play()
		SceneManager.DelayChangeScene("res://Scene/Level/Level3.tscn", 2)
		GameData.gameDataRes.is_level2_clear = true
	else:
		DialogueManager.show_dialogue_balloon(load(language), "Stair_door_3F")



func mechanicalRoomDoor(language):
	DialogueManager.show_dialogue_balloon(load(language), "Mechanical_room")
	
	
	
func prisonDoor(language):
	var checkItem = UImanager.get_node("Inventory").FindItem(EnumData.ItemName.PRISON_KEY)
	var isPrisonDoor = GameData.gameDataRes.is_prison_door_open

	if checkItem == null && isPrisonDoor == false:
		DialogueManager.show_dialogue_balloon(load(language), "First_meet_cluey")
	elif isPrisonDoor:
		movePlayer()
	else:
		UImanager.get_node("Inventory").DeleteItem(EnumData.ItemName.PRISON_KEY)
		GameData.gameDataRes.is_prison_door_open = true
		$AnimationPlayer.play("open_prison_out_door")



func movePlayer():
	if (self.nextDoor != null):
		UImanager.get_node("FadeInOut").TeleportPlay()
		#await get_tree().create_timer(0.25).timeout
		playerPos.global_position = nextDoor.global_position


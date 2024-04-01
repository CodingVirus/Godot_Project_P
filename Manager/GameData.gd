extends Node

@export var firstGameDataRes : GameData_Resource
@export var gameDataRes : GameData_Resource
@export var playerScene : PackedScene

const SAVE_GAME_PATH = "user://save.tres"

var isDialogueStart = EnumData.DialogueState.END
var isPlayerState = EnumData.PlayerState.IDLE

func _ready():
	#if LoadExists() == true: Load()
	#else: gameDataRes = firstGameDataRes
	gameDataRes = firstGameDataRes
	
func LoadExists() -> bool:
	return ResourceLoader.exists(SAVE_GAME_PATH)
	
func Load():
	gameDataRes = ResourceLoader.load(SAVE_GAME_PATH)
	
func Save(path:String):
	gameDataRes.save_scene_path = path
	ResourceSaver.save(gameDataRes, SAVE_GAME_PATH)
	
func ResetSave():
	gameDataRes = firstGameDataRes
	

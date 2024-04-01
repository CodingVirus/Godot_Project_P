extends Resource

class_name GameData_Resource

@export var save_scene_path = "res://Scene/Level/Level1.tscn"
@export var is_first_start = EnumData.GameState.FIRST_START

# Overall Control
@export var is_use_computer = false

# LEVEL 1
@export var is_accept_generator_quest = false
@export var is_fix_generator = false

# LEVEL 2
@export var is_accept_cluey_quest_first = false
@export var is_clear_cluey_quest_first = false
@export var is_prison_door_open = false
@export var is_b3_up_stair_open = false
@export var is_level2_clear = false
@export var is_accept_cluey_quest_second = false
@export var is_clear_cluey_quest_second = false

# Save Point 4
@export var is_incinerator_ready = false
@export var is_incinerator_password_correct = false

@export var dialogue_language = "res://Dialogue/KOREAN.dialogue"


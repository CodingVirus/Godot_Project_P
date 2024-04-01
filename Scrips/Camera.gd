extends Camera2D

var targetPosition = Vector2.ZERO

var test = true
var widthSize = 0
var lengthSize = 0
@export var maxWidthSize = 2.4 # 씬마다 x의 길이가 다르므로 각 씬에 맞게 길이를 설정하기 위한 변수

func _ready():
	#print(get_viewport_rect().size.x)
	widthSize = get_viewport_rect().size.x
	lengthSize = get_viewport().size.y

func _process(delta):
	if test == true:
		followPlayer()
		global_position = lerp(targetPosition, global_position, pow(2, -25 * delta))
	
	if global_position.x < (widthSize / 2):
		global_position.x = widthSize / 2
	elif global_position.x > (widthSize * maxWidthSize):
		global_position.x = widthSize * maxWidthSize
		
func followPlayer():
	var players = get_tree().get_nodes_in_group("player")
	if (players.size() > 0):
		var player = players[0]
		targetPosition = player.global_position
		#targetPosition.y = lengthSize / 2
		targetPosition.y -= 350

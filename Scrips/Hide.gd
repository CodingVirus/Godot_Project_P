extends Area2D

var isMove = false
var isHide = false
var getPlayer : CharacterBody2D
@export_file var nextScene : String

func _on_body_entered(body):
	if body.is_in_group("player"):
		getPlayer = body
		isMove = true
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		getPlayer = null
		isMove = false 
		
func _process(delta):
	if isMove ==  true && isHide == false && Input.is_action_just_pressed("interaction"):
		isHide = true
		UImanager.get_node("LightControl").visible = true
		$PointLight2D.visible = true
		getPlayer.visible = false
		GameData.isPlayerState = EnumData.PlayerState.HIDE
		
	elif isMove ==  true && isHide == true && Input.is_action_just_pressed("interaction"):
		isHide = false
		UImanager.get_node("LightControl").visible = false
		$PointLight2D.visible = false
		getPlayer.visible = true
		GameData.isPlayerState = EnumData.PlayerState.IDLE

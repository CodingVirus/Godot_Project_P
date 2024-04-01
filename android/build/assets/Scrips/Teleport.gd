extends Area2D

var isMove = false
@export_file var nextScene : String

func _on_body_entered(body):
	if body.is_in_group("player"):
		isMove = true
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		isMove = false 
		
func _process(delta):
	if isMove ==  true && Input.is_action_just_pressed("interaction"):
		get_tree().change_scene_to_file(nextScene)

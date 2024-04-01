extends CanvasLayer


func Play():
	$AnimationPlayer.play("FadeInOut")
	
func TeleportPlay():
	$AnimationPlayer.play("Teleport")

func ShortPlay():
	$AnimationPlayer.play("Short")

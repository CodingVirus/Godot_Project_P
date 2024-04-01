extends CharacterBody2D

var gravity = 300
var maxHorizontalSpeed = 1000

func _ready():
	#print(get_tree().current_scene.scene_file_path)
	pass

func _process(delta):
	
	if (GameData.isPlayerState != EnumData.PlayerState.STOP && 
	GameData.isPlayerState != EnumData.PlayerState.HIDE):
		
		var moveVector = Vector2.ZERO
		moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		
		if moveVector.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif moveVector.x > 0:
			$AnimatedSprite2D.flip_h = false
			
		velocity.x = moveVector.x * maxHorizontalSpeed
		velocity.y += gravity * delta
		move_and_slide()
		
		if (moveVector != Vector2.ZERO):
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.stop()
	

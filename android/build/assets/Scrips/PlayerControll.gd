extends CharacterBody2D

var gravity = 300
var maxHorizontalSpeed = 1000

func _ready():
	pass

func _process(delta):
	
	var moveVector = Vector2.ZERO
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.x = moveVector.x * maxHorizontalSpeed
	
	velocity.y += gravity * delta
	move_and_slide()
	
	

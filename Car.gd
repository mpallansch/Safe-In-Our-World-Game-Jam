extends Sprite2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	#Movement when direction button pressed
	if Input.is_action_just_pressed("down"):
		$AnimationPlayer.play("WalkDown");
	if Input.is_action_just_pressed("right"):
		$AnimationPlayer.play("WalkRight");
	if Input.is_action_just_pressed("ui_left"):
		$AnimationPlayer.play("WalkLeft");
	if Input.is_action_just_pressed("ui_up"):
		$AnimationPlayer.play("WalkUp");
		
	#if %CharacterBody2D is in %CollisionShape2D and Input.is_action_just_pressed(Enter_Exit_Vehicle)
	#hide("%CharacterBody2D")
	#%CharacterBody2D.position = %DriveableCar.position

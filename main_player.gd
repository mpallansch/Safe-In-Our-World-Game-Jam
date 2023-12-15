extends CharacterBody2D


const SPEED = 300.0
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
	
	#Movement when direction button released
	if Input.is_action_just_released("down"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("right"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("left"):
		$AnimationPlayer.stop()
	if Input.is_action_just_released("up"):
		$AnimationPlayer.stop()
		
	




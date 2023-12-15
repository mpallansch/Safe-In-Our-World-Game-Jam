extends StaticBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	#Movement when direction button pressed
	if Input.is_action_just_pressed("down"):
		$AnimationPlayer.play("CarDown");
	if Input.is_action_just_pressed("right"):
		$AnimationPlayer.play("CarRight");
	if Input.is_action_just_pressed("ui_left"):
		$AnimationPlayer.play("CarLeft");
	if Input.is_action_just_pressed("ui_up"):
		$AnimationPlayer.play("CarUp");

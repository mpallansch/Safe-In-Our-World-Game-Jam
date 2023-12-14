extends CharacterBody2D

# Called when the node enters the scene tree for the first time.

func _physics_process(delta): 
	
	#Movement when direction button pressed
	if Input.is_action_just_pressed("down"):
		$AnimationPlayer.play("WalkDown");
	elif Input.is_action_just_pressed("right"):
		$AnimationPlayer.play("WalkRight");
	if Input.is_action_just_pressed("ui_left"):
		$AnimationPlayer.play("WalkLeft");
	elif Input.is_action_just_pressed("ui_up"):
		$AnimationPlayer.play("WalkUp");
	
	#Idle Position after direction button is released
	if Input.is_action_just_released("down"):
		$AnimationPlayer.play("IdleDown");
	if Input.is_action_just_released("left"):
		$AnimationPlayer.play("IdleLeft");
	if Input.is_action_just_released("right"):
		$AnimationPlayer.play("IdleRight");
	if Input.is_action_just_released("up"):
		$AnimationPlayer.play("IdleUp");
		
	#Sword attack animation when attack button pressed
	if Input.is_action_just_pressed("AttackLeft"):
		$AnimationPlayer.play("SwordAttackLeft")
	if Input.is_action_just_pressed("AttackRight"):
		$AnimationPlayer.play("SwordAttackRight")
	if Input.is_action_just_pressed("AttackUp"):
		$AnimationPlayer.play("SwordAttackUp")
	if Input.is_action_just_pressed("AttackDown"):
		$AnimationPlayer.play("SwordAttackDown")
		
	#Sword attack animation when attack button pressed
	if Input.is_action_just_released("AttackDown"):
		$AnimationPlayer.play("IdleDown");
	if Input.is_action_just_released("AttackLeft"):
		$AnimationPlayer.play("IdleLeft");
	if Input.is_action_just_released("AttackRight"):
		$AnimationPlayer.play("IdleRight");
	if Input.is_action_just_released("AttackUp"):
		$AnimationPlayer.play("IdleUp");
		

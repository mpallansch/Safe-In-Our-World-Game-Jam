extends CharacterBody2D

var paused

var health = 40
var health_max = 80
var attack_power = 10
var defense = 4

var last_direction = "up"
var movement_animation_mapping = {
	"up": {
		"idle": "IdleUp",
		"walk": "WalkUp",
		"punch": "PunchUp",
		"active": false
	},
	"down": {
		"idle": "IdleDown",
		"walk": "WalkDown",
		"punch": "PunchDown",
		"active": false
	},
	"left": {
		"idle": "IdleLeft",
		"walk": "WalkLeft",
		"punch": "PunchLeft",
		"active": false
	},
	"right": {
		"idle": "IdleRight",
		"walk": "WalkRight",
		"punch": "PunchRight",
		"active": false
	},
}

# UI nodes
@onready var pause_screen =  %Pause_Menu
# assuming the character by default looks to the right


func _input(event):
	if !pause_screen.visible:
		if event.is_action_pressed("Pause"):
			get_tree().paused = true
			#show pause screen popup
			%Pause_Menu.visible = true
			#stops movement processing 
			set_physics_process(false)
			#set pauses state to be true
			paused = true
			#resume game


func _on_resume_pressed():
		#hide pause menu
	pause_screen.visible = false
		#set pauses state to be false
	get_tree().paused = false
	paused = false
		#accept movement and input
	set_process_input(true)
	set_physics_process(true)  


func _process(delta):
	var moving = false
	for action in movement_animation_mapping:
		var action_obj = movement_animation_mapping[action]
		if Input.is_action_just_pressed(action):
			action_obj.active = true
			last_direction = action
		if Input.is_action_just_released(action):
			action_obj.active = false
			last_direction = action
		if action_obj.active:
			moving = true
			last_direction = action
	
	
	var action_obj = movement_animation_mapping[last_direction]
	if Input.is_action_just_pressed("Punch"):
		$AnimationPlayer.play(action_obj.punch)
	elif moving:
		$AnimationPlayer.play(action_obj.walk)
	else:
		$AnimationPlayer.play(action_obj.idle)
		
	
	





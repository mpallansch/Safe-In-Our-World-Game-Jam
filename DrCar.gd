extends CharacterBody2D

var wheel_base = 70
var steering_angle = 15
var engine_power = 900
var friction = -55
var drag = -0.06
var braking = -450
var max_speed_reverse = 250
var slip_speed = 400
var traction_fast = 2.5
var traction_slow = 10

var acceleration = Vector2.ZERO
var steer_direction

var car_zone = false
var active = false

func _physics_process(delta):
	acceleration = Vector2.ZERO
	get_input()
	apply_friction(delta)
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()
	
func apply_friction(delta):
	if acceleration == Vector2.ZERO and velocity.length() < 50:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction * delta
	var drag_force = velocity * velocity.length() * drag * delta
	acceleration += drag_force + friction_force
	
func get_input():
	var turn = Input.get_axis("steer_left", "steer_right")
	steer_direction = turn * deg_to_rad(steering_angle)
	if Input.is_action_pressed("accelerate"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("brake"):
		acceleration = transform.x * braking
	
func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = rear_wheel.direction_to(front_wheel)
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = lerp(velocity, new_heading * velocity.length(), traction * delta)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
#	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
	
	
	if active:
		%Camera2D.make_current()
		#movement()
		#leaving_car()
	elif !active: 
		entering_car()
	
 
	
func entering_car():
	if Input.is_action_just_pressed("Interact") && car_zone:
		print("here")
		var hidden_player = get_parent().get_parent().get_node("player")
		hidden_player.hide() 
		%Camera2D.make_current()
		active = true
		
#func leaving_car():
	#var vehicle = $"."
	#var hidden_player = get_parent().get_node("player")
	#var newLoc = vehicle.position- 2*vehicle.position.x
	
	#if car_zone == false && Input.is_action_just_pressed("Interact"):
	#	hidden_player.active = true
	#	active = false
	#	hidden_player.position = newLoc
	
 
func _on_player_detect_body_entered(body):
	if body.name == "player":
		car_zone = true
		get_node("player")
		hide()
		
 
func _on_player_detect_body_exited(body):
	if body.name == "player":
		car_zone = false


func _on_area_2d_body_entered(body):
	if body.name == "player":
		car_zone = true
		get_node("%player")
		hide()


func _on_area_2d_body_exited(body):
	if body.name == "player":
		car_zone = false

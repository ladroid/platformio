extends KinematicBody2D

const speed = 60
const gravity = 10
const jump_power = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var on_ground = false

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0	
		
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = jump_power
			on_ground = false
	
	velocity.y += gravity
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	velocity = move_and_slide(velocity, FLOOR)

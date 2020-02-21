extends KinematicBody2D

const gravity = 10
const FLOOR = Vector2(0, -1)

const fireball = preload("res://Fireball.tscn")

var velocity = Vector2()
var on_ground = false
var is_dead = false
var speed = 60
var jump_power = -250

func _physics_process(delta):
	if Global.archerButton == true:
		speed = 150
		jump_power = -350
	elif Global.warriorButton == true:
		speed = 30
	else:
		speed = speed
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true:
				$AnimatedSprite.play("idle")	
			
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				velocity.y = jump_power
				on_ground = false
		
		if Input.is_action_just_pressed("ui_focus_next"):
			var fire_ball = fireball.instance()
			if sign($Position2D.position.x) == 1:
				fire_ball.set_fireball_direction(1)
			else:
				fire_ball.set_fireball_direction(-1)
			get_parent().add_child(fire_ball)
			fire_ball.position = $Position2D.global_position
		
		velocity.y += gravity
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("jump")
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()

func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$AnimatedSprite.play("fall")
	$CollisionShape2D.disabled = true
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene("res://StageOne.tscn")

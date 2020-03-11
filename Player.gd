extends KinematicBody2D

const gravity = 10
const FLOOR = Vector2(0, -1)

const fireball = preload("res://Fireball.tscn")
const arrow = preload("res://Arrow.tscn")
const light = preload("res://Lightning.tscn")

var velocity = Vector2()
var on_ground = false
var is_dead = false
var speed = 60
var jump_power = -250

func _physics_process(delta):
	if Global.archerButton == true:
		speed = 150
		jump_power = -350
		get_node("AnimatedSprite").scale = Vector2(0.733, 0.803)
	elif Global.warriorButton == true:
		speed = 30
		get_node("AnimatedSprite").scale = Vector2(0.113, 0.112)
		#get_node("AnimatedSprite").position = Vector2(-1.185, -8.686)
	else:
		speed = speed
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			if Global.archerButton == true:
				$AnimatedSprite.play("archer_run")
			elif Global.warriorButton == true:
				$AnimatedSprite.play("knight_run")
			else:
				$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			if Global.archerButton == true:
				$AnimatedSprite.play("archer_run")
			elif Global.warriorButton == true:
				$AnimatedSprite.play("knight_run")
			else:
				$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true:
				if Global.archerButton == true:
					$AnimatedSprite.play("archer_idle")
				elif Global.warriorButton == true:
					$AnimatedSprite.play("knight_idle")
					get_node("AnimatedSprite").position = Vector2(-1.185, -8.486)
				else:
					$AnimatedSprite.play("idle")	
			
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				velocity.y = jump_power
				on_ground = false
		
		if Input.is_action_just_pressed("ui_focus_next"):
			if Global.archerButton == true:
				var arrow_att = arrow.instance()
				if sign($Position2D.position.x) == 1:
					arrow_att.set_arrow_direction(1)
				else:
					arrow_att.set_arrow_direction(-1)
				get_parent().add_child(arrow_att)
				arrow_att.position = $Position2D.global_position
			elif Global.warriorButton == true:
				$AnimatedSprite.play("knight_attack")
			else:
				var fire_ball = fireball.instance()
				if sign($Position2D.position.x) == 1:
					fire_ball.set_fireball_direction(1)
				else:
					fire_ball.set_fireball_direction(-1)
				get_parent().add_child(fire_ball)
				fire_ball.position = $Position2D.global_position
		if Input.is_action_just_pressed("l_press"): 
			var light_instance = light.instance()
			randomize()
			var spawnPos = get_parent().get_node("spawnPos").get_children()
			var spawnIndx = randi() % spawnPos.size()
			var spawnPonts = spawnPos[spawnIndx]
			spawnPos.remove(spawnIndx)
			var pos = spawnPonts.get_global_position()
			light_instance.set_global_position(pos)
			get_parent().add_child(light_instance)
			#print(light)
			
		velocity.y += gravity
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			if velocity.y < 0:
				if Global.archerButton == true:
					$AnimatedSprite.play("archer_jump")
				elif Global.warriorButton == true:
					$AnimatedSprite.play("knight_jump")
				else:
					$AnimatedSprite.play("jump")
			else:
				if Global.archerButton == true:
					$AnimatedSprite.play("archer_jump")
				elif Global.warriorButton == true:
					$AnimatedSprite.play("knight_jump")
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
	if Global.archerButton == true:
		$AnimatedSprite.play("archer_fall")
	elif Global.warriorButton == true:
		$AnimatedSprite.play("knight_fall")
	else:
		$AnimatedSprite.play("fall")
	$CollisionShape2D.disabled = true
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene("res://StageOne.tscn")

extends KinematicBody2D

const gravity = 10
#const speed = 30
var speed = 1
var hp = 1
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false
var rand_enemy

func _ready():
	randomize()
	speed = randi() % 100 + 1
	hp = randi() % 100 + 1
	rand_enemy = randi() & 1

func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		velocity = Vector2(0, 0)
		if rand_enemy == 0:
			$AnimatedSprite.play("dead")
		elif rand_enemy == 1:
			$AnimatedSprite.play("bat_dead")
		#$CollisionShape2D.disabled = true
		$CollisionShape2D.set_deferred("disabled", true)
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed * direction
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		if rand_enemy == 0:
			$AnimatedSprite.play("walk")
		elif rand_enemy == 1:
			$AnimatedSprite.play("bat_fly")
		velocity.y += gravity
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	Global.score += 1
	var LabelNode = get_parent().get_node("ScoreCounter/UI/Control/RichTextLabel")
	LabelNode.text = "Kills:" + str(Global.score)
	print(Global.score)
	queue_free()

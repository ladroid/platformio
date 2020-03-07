extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	$AnimatedSprite.play("coin_anim")


func _on_Coins_body_entered(body):
	var a = 0
	if "Player" == body.name:
		a+=1
		print(a)
		queue_free()

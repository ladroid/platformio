extends Area2D


func _on_Lightning_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	yield(get_tree().create_timer(3),"timeout")
	queue_free()

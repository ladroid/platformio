extends Area2D


func _on_Lightning_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	#queue_free()

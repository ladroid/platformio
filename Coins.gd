extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	$AnimatedSprite.play("coin_anim")


func _on_Coins_body_entered(body):
	if "Player" == body.name:
		Global.collect_coins += 1
		var LabelText = get_parent().get_node("CoinsCollector/UI/Control/RichTextLabel")
		LabelText.text = str(Global.collect_coins)
		queue_free()

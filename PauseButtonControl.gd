extends Control

var pause = false
	
func _process(delta):
	if pause == true:
		$Button/AnimatedSprite.play("stop")
		get_tree().paused = true
	else:
		$Button/AnimatedSprite.play("play")
		get_tree().paused = false

func _on_Button_pressed():
	pause = true

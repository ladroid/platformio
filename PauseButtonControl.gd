extends Control

var pause = false
	
func _process(delta):
	if pause == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Button_pressed():
	pause = true

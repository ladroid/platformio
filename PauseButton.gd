extends Button

var on = true

func _on_Button_pressed():
	if on == true:
		get_tree().set_pause(true)
		on = false
		print("A")
	else:
		print("B")
		get_tree().set_pause(false)
		on = true

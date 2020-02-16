extends Button

onready var sound = $AudioStreamPlayer2D
var on = true

func _on_Button_pressed():
	if on == true:
		sound.play()
		on = false
	else:
		sound.stop()
		on = true

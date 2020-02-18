extends Button

onready var sound = $AudioStreamPlayer2D
var on = true

func _on_Button_pressed():
	if on == true:
		$AnimatedSprite.play("soundon")
		sound.play()
		on = false
	else:
		$AnimatedSprite.play("soundoff")
		sound.stop()
		on = true

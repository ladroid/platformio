extends Control

var pause = false

func _ready():
	pause = false

func _process(delta):
	if pause == true:
		$Button/AnimatedSprite.play("stop")
		get_tree().paused = true
		$PopupDialog.show()
	else:
		$PopupDialog/unpause/AnimatedSprite.play("play")
		get_tree().paused = false
		$PopupDialog.hide()

func _on_Button_pressed():
	pause = true


func _on_unpause_pressed():
	pause = false
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().quit(1)

extends Node

func _on_start_pressed():
	get_tree().change_scene("res://StageTwo.tscn")



func _on_quit_pressed():
	get_tree().quit(1)

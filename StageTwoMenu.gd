extends Node

func _on_warrior_pressed():
	Global.warriorButton = true
	if Global.warriorButton == true:
		get_tree().change_scene("res://StageOne.tscn")


func _on_wizard_pressed():
	Global.wizardButton = true
	if Global.wizardButton == true:
		get_tree().change_scene("res://StageOne.tscn")


func _on_archer_pressed():
	Global.archerButton = true
	if Global.archerButton == true:
		get_tree().change_scene("res://StageOne.tscn")

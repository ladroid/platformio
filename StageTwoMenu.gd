extends Node

var warriorButton = false
var wizardButton = false
var archerButton = false

func _on_warrior_pressed():
	warriorButton = true
	if warriorButton == true:
		get_tree().change_scene("res://StageOne.tscn")


func _on_wizard_pressed():
	wizardButton = true
	if wizardButton == true:
		get_tree().change_scene("res://StageOne.tscn")


func _on_archer_pressed():
	archerButton = true
	if archerButton == true:
		get_tree().change_scene("res://StageOne.tscn")

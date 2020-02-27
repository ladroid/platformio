extends Area2D

export(String, FILE, "*.tscn") var target_stage

func _ready():
	pass # Replace with function body.

func _process(delta):
	get_parent().get_node("StagesText/Sprite").hide()
	$AnimatedSprite.play("flame")


func _on_ChangeStage_body_entered(body):
	if "Player" in body.name:
		get_parent().get_node("StagesText/Sprite").visible = true
		get_parent().get_node("StagesText/Control/CenterContainer/Label").text ="A"
		get_tree().change_scene(target_stage)
		get_parent().get_node("StagesText/Sprite").hide()

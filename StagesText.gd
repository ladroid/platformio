extends Node

func _ready():
	pass

func _process(delta):
	print("AAAAAAAAAA")
	print(Global.count_stage)
	$Control/CenterContainer/Label.text = "Day " + str(Global.count_stage)
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().change_scene("res://StageOne.tscn")

func timeout():
	var t = Timer.new()
	t.stop()

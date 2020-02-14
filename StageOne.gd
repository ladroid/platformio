extends Node

export (PackedScene) var enemy

var spawn_left = Vector2(80, 147.585)
var spawn_right = Vector2(188, 147.585)

func spawn_enemy():
	var new_enemy = enemy.instance()
	var temp = null
	if rand_range(0, 2) > 0:
		temp = spawn_right
	else:
		temp = spawn_left
	new_enemy.set_position(temp)
	add_child(new_enemy)
	
func _ready():
	spawn_enemy()


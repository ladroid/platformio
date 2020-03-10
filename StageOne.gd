extends Node

export (PackedScene) var enemy
export (PackedScene) var coin

var spawn_left = Vector2(80, 147.585)
var spawn_right = Vector2(290, 147.585)

func spawn_enemy():
	#TODO: when we have infinty platform
	#make for-loop for enemy 
	#for i in range(0, 16):
	#	new_enemy = enemy.instance()
	#randomize()
	for i in rand_range(1, 6):
		var new_enemy = enemy.instance()
		var temp = null
		if rand_range(0, 2) > 0:
			temp = spawn_right
		else:
			temp = spawn_left
		new_enemy.set_position(temp)
		add_child(new_enemy)
		
func spawn_coins():
	#randomize()
	for i in range(5):
		var new_coin = coin.instance()
		var temp = null
		if rand_range(0, 2) > 0:
			temp = spawn_right
		else:
			temp = spawn_left
		new_coin.set_position(temp)
		add_child(new_coin)
		
func increase_enemy():
	if Global.enemy_increase > 0:
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
	spawn_coins()
	increase_enemy()
	randomize()
	Global.world = self

func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location

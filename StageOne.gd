extends Node

export (PackedScene) var enemy

var spawn_left = Vector2(80, 147.585)
var spawn_right = Vector2(188, 147.585)

var player_change = load("res://StageTwoMenu.gd")

func player_change():
	var player_func = player_change.new()
	print("C")
	if player_func.archerButton == true:
		print("Zzz")
	#if player_func._on_archer_pressed() == true:
	#	print('DD')

func spawn_enemy():
	#TODO: when we have infinty platform
	#make for-loop for enemy 
	#for i in range(0, 16):
	#	new_enemy = enemy.instance()
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
	player_change()
	Global.world = self

func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location

extends TileMap
"""
var grid = []

func _ready():
	grid.resize(17)
	for n in 17:
		grid[n] = []
		grid[n].resize(17)
		for m in 17:
			#if(n%15==0 or m%8==0) and randi()%20!=0:
				#grid[n][m] = 0
			#else:
				#grid[n][m] = -1
			grid[n][m] = randi() % 4
	for n in range(0, 16):
		for m in range(0, 16):
			if grid[n][m] == 0:
				#set_cell(n, m, (n+m)%2)
				set_cell(n, m, grid[n][m])"""

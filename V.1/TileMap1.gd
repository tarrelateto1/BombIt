extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func is_cell_vacant(pos):
	var grid_pos = world_to_map(pos)
	print("x : ",grid_pos.x)
	print("y :",grid_pos.y)
	print("world : ",world_to_map(pos))
#	print(grid_pos)
	#ตรวจสอบตำแหน่งของ player ตำแหน่ง x	
	
	return grid_pos

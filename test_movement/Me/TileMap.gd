extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tile_size = get_cell_size()
var halt_tile_size = tile_size / 2

#enum ENTITY_TYPES{PLATER,OBSTACLE,COLLECTIBLE}

# จำนวนตาราง
var grid_size = Vector2(10,10) 
var grid=[]

onready var Obstacle = preload("res://Obstacle.tscn")


func _ready():
#	1.create the grid array
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
			
	var Player =get_node("Player")
	var start_pos = update_child_pos(Player)
	Player.set_position(start_pos)
			
	var positions= []
#	2.create obstacles
#
#	for n in range(5):
#		var grid_pos = Vector2(randi() %int(grid_size.x),randi()%int(grid_size.y))
#		if not grid_pos in positions:
#			positions.append(grid_pos)
#
#	for pos in position:
#		var new_obstacle = Obstacle.instance()
#		new_obstacle.set_pos(map_to_world(pos))
##		grid[pos.x][pos.y]= OBSTACLE
#		add_child(new_obstacle)	

	pass
# ดูว่าสามารถเคลื่อนที่ไปได้หรอเปล่า
func is_cell_vacant(pos,direction):
	var grid_pos = world_to_map(pos)+direction
	#ตรวจสอบตำแหน่งของ player ตำแหน่ง x	
	if grid_pos.x<grid_size.x and grid_pos.x >=0 :
		#ตรวจสอบตำแหน่งของ player ตำแหน่ง y
		if grid_pos.y < grid_size.y and grid_pos.y>=0 :
			
#			if grid_pos.x ==2 and grid_pos.y==2:
#				return false
			return true if grid[grid_pos.x][grid_pos.y] == null else false
	return false
	
	# update ตำแหน่งให้ตรง
func update_child_pos(child_node):
	# ดึงnode	
	var grid_pos = world_to_map(child_node.get_position())
#	ดูposition
	print(grid_pos)
	grid[grid_pos.x][grid_pos.y] = null
	print(child_node.direction)
	var new_grid_pos = grid_pos + child_node.direction 
	grid[new_grid_pos.x][new_grid_pos.y] = child_node.type
#	print(grid[new_grid_pos.x][new_grid_pos.y])
	var target_pos = map_to_world(new_grid_pos) + halt_tile_size
#	print(target_pos)
	return target_pos
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

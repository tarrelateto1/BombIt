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
var grid_wall = [[1,1],[3,1],[5,1],[7,1],[9,1],   #แถวหนึ่ง
			[1,3],[3,3],[5,3],[7,3],[9,3],    #แถวสาม
			[1,5],[3,5],[8,5],					#แถวห้า
			[6,6],								#แถวหก
			[1,7],[3,7],[5,7],[6,7],[7,7],[9,7]			
]



func _ready():
#	1.create the grid array
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
			
	var Player =get_node("Player")
	var start_pos = update_child_pos($Player)
	Player.set_position(start_pos)
	print(Player)
			
	var positions= []
	print(positions)
	
#	grid_rock.append([1,1])
#	var grid_rock = [[1,1],[1,3]]
##	print(grid_rock.size())
#	for i in range(0, grid_rock.size()):
#		for j in range(0, 2):
#    	print(grid_rock[i][j])
#	print(grid_rock[0][0])
#	for i in grid_rock:
#		print(i[0][0])
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
#	print(grid_pos)
	#ตรวจสอบตำแหน่งของ player ตำแหน่ง x	
	if grid_pos.x<grid_size.x and grid_pos.x >=0 :
		#ตรวจสอบตำแหน่งของ player ตำแหน่ง y
		if grid_pos.y < grid_size.y and grid_pos.y>=0 :			
			for i in range(0, grid_wall.size()):
					if grid_pos.x ==grid_wall[i][0] and grid_pos.y==grid_wall[i][1]:
						return false
			return true if grid[grid_pos.x][grid_pos.y] == null else false
	return false
	
	# update ตำแหน่งให้ตรง
func update_child_pos(child_node):
	# ดึงnode	
	$Player
	var grid_pos = world_to_map(child_node.get_position())
#	var grid_pos = $Player.get_position()
#	ดูposition
	
	grid[grid_pos.x][grid_pos.y] = null
#	print(child_node.direction)
	var new_grid_pos = grid_pos + child_node.direction 
#	print(new_grid_pos)
	grid[new_grid_pos.x][new_grid_pos.y] = child_node.type
#	print(grid[new_grid_pos.x][new_grid_pos.y])
	var target_pos = map_to_world(new_grid_pos) + halt_tile_size
#	print(target_pos)
	print("new :",new_grid_pos)
	print("target :",target_pos)
	return target_pos
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

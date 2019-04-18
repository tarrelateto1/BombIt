extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var start = get_node("KinematicBody2sD")
var queue =[]

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	print("tile ",$TileMap.world_to_map(start.get_position()))
	print("start ",start.get_position())
#	start.position = Vector2(32,96)
#	print("next ",start.get_position())
	var frontier = []
	frontier.append(10)
	frontier.append(11)
	frontier.pop_front()
	print(frontier)
	print(frontier.size())
#	print(frontier[1])
#	print(Vector2(10,10))
	
	var a =find_neighbors(start)
#	test(start)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	find_neighbors(1,2)
#	test(start)
	pass
func test(start):
	var current
	var frontier = []
	var currentleft = 0 
	frontier.append(start)
	var visits = [] 
	visits.append(null)
	while visits.size() >0 && visits.size()<3 :
		current = frontier.pop_front()
		print("current : ",current)
#		currentleft +=1
		for next in find_neighbors(current):
			print("next : ",next)
			for visit in visits :
				print("all visits : " ,visit)
				print("visit : ",visit)
				if next != visit:
					frontier.append(next)
#					visits.append(current)
					print("frontier : ",frontier)
					print("visits : ",visits)
#				print(next)
			visits.append(current)

			
			
			
	
	pass

func bfs():
	
	pass
	
func find_neighbors(start):
	print("test neighbors")
	print("top  :",start.position+Vector2(0,-32))
	print("left :",start.position+Vector2(-32,0))
	print("bot  :",start.position+Vector2(0,32))
	print("right  :",start.position+Vector2(32,0))
	var frontier =[]
# Ptop
	var Ptop =KinematicBody2D.new() 
	Ptop.position = start.position+Vector2(0,-32)
	var shape_H_TOP = RectangleShape2D.new()
	shape_H_TOP.set_extents(Vector2(10,10))
	var collision_H_TOP = CollisionShape2D.new()
	collision_H_TOP.set_shape(shape_H_TOP)
	Ptop.add_child(collision_H_TOP)
	add_child(Ptop)
	print("Ptop ", Ptop.get_position())
	
	#PLEFT
	var Pleft = KinematicBody2D.new() 
	Pleft.position = start.position+Vector2(-32,0)
	var shape_V_LEFT = RectangleShape2D.new()
	shape_V_LEFT.set_extents(Vector2(10,10))
	var collision_V_LEFT = CollisionShape2D.new()
	collision_V_LEFT.set_shape(shape_V_LEFT)
	Pleft.add_child(collision_V_LEFT)
	add_child(Pleft)
#PBOT	
	var Pbot = KinematicBody2D.new() 
	Pbot.position = start.position+Vector2(0,32)
	var shape_H_BOT = RectangleShape2D.new()
	shape_H_BOT.set_extents(Vector2(10,10))
	var collision_H_BOT = CollisionShape2D.new()
	collision_H_BOT.set_shape(shape_H_BOT)
	Pbot.add_child(collision_H_BOT)
	add_child(Pbot)
	#PRIGHT
	var Pright = KinematicBody2D.new() 
	Pright.position = start.position+Vector2(32,0)
	var shape_V_Right = RectangleShape2D.new()
	shape_V_Right.set_extents(Vector2(10,10))
	var collision_V_Right = CollisionShape2D.new()
	collision_V_Right.set_shape(shape_V_Right)
	Pright.add_child(collision_V_Right)
	add_child(Pright)
	
	frontier.append(Ptop)
	frontier.append(Pleft)
	frontier.append(Pbot)
	frontier.append(Pright)
	get_tree().root.print_tree_pretty()
	print(frontier)
	
	return frontier
	pass
	
	
	
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
	print(frontier.size())
	print(frontier[1])
#	print(Vector2(10,10))
	
	var a =find_neighbors(start)
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	find_neighbors(1,2)
	test(start)
	pass
func test(start):
	var current
	var frontier = []
	var currentleft = 0 
	frontier.append(start)
	var visits = [] 
	visits.append(null)
	while visits.size() >0:
		current = frontier.pop_front()
#		currentleft +=1
		for next in find_neighbors(current):
			for visit in visits :
				if next != visit:
					frontier.append(next)
					visits.append(current)
#			if next != in
			
			
			
	
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
	var Ptop =KinematicBody2D.new()
	
	frontier.append(start.position+Vector2(0,-32))
	frontier.append(start.position+Vector2(-32,0))
	frontier.append(start.position+Vector2(0,32))
	frontier.append(start.position+Vector2(32,0))
	print(frontier)
	
	return frontier
	pass
	
	
	
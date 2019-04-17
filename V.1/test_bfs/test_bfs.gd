extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var start = get_node("KinematicBody2sD")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	print("tile ",$TileMap.world_to_map(start.get_position()))
	print("start ",start.get_position())
#	start.position = Vector2(32,96)
#	print("next ",start.get_position())
	find_neighbors(start)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	find_neighbors(1,2)
	pass


func bfs():
	pass
	
func find_neighbors(start):
	print("test neighbors")
	print("top  :",start.position+Vector2(0,-32))
	print("left :",start.position+Vector2(-32,0))
	print("bot  :",start.position+Vector2(0,32))
	print("right  :",start.position+Vector2(32,0))
	pass
	
	
	
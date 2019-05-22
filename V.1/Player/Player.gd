extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hp 
var speed 
var range_bomb
var number_bomb
var number_current_bomb
var Bomb = preload("res://Bomb/Bomb.tscn")

var grid


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	grid = Singleton.grid
	hp = 3
	speed = 200
	range_bomb=1
	number_bomb=1
	number_current_bomb=0
	pass

func add_bomb():
	
	var bomb = Bomb.instance()
	var s_grid = Singleton.grid
	bomb.max_bomb = range_bomb
	bomb.scale = Vector2(1,1)
	bomb.z_index = -1
	var g = s_grid.is_cell_vacant(self.get_position())
	#bomb.position = Vector2(170,70)
	bomb.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
	#bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
	get_parent().add_child(bomb)
	
	pass
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

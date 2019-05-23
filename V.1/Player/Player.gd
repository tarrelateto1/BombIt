extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hp 				# update hp
var speed 
var range_bomb 		#update cola
var number_bomb		 #update balloon
var shield
var number_current_bomb
var Bomb = preload("res://Bomb/Bomb.tscn")

#item 
var item_speed
var grid
var list_bomb = []

#var move = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	item_speed = 1
	grid = Singleton.grid
	hp = 3
	speed = 200
	shield = 0
	range_bomb=1
	number_bomb=1
	number_current_bomb=0
	pass

func add_bomb():
#	print(number_current_bomb)
#	print(number_bomb)
	if number_current_bomb == 0  :
		number_current_bomb+=1
		var bomb = Bomb.instance()
		var s_grid = Singleton.grid
		bomb._update(self)
		bomb.max_bomb = range_bomb
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		var g = s_grid.is_cell_vacant(self.get_position())
		#bomb.position = Vector2(170,70)
		bomb.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
		#bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
#		print(number_current_bomb)
#		print(number_bomb)
#		print("วางแล้ว")
		get_parent().add_child(bomb)
		list_bomb.append(bomb)
	elif number_current_bomb>0 && number_current_bomb<number_bomb:
		
		var bomb = Bomb.instance()
		var s_grid = Singleton.grid
		bomb._update(self)
		bomb.max_bomb = range_bomb
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		var g = s_grid.is_cell_vacant(self.get_position())
		#bomb.position = Vector2(170,70)
		bomb.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
		
		for i in list_bomb:
			var wr = weakref(i)
			
			if wr.get_ref() !=null:
				if i.get_position() != bomb.get_position() :
					number_current_bomb+=1
#					print(number_current_bomb)
#					print(number_bomb)
#					print("วางแล้ว")
					get_parent().add_child(bomb)
					list_bomb.append(bomb)
					break
				


			


#				if i.get_position() != bomb.get_position():
#					get_parent().add_child(bomb)
#					list_bomb.append(bomb)
#		for i in list_bomb:
#			var wr = weakref(i)
#			if wr.get_ref() != null:
#				print(i.get_position())
	#	print(list_bomb)
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

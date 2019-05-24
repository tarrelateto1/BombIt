extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hp 				# update hp
var speed 
var range_bomb 		#update cola
var number_bomb		 #update balloon
var number_current_bomb
var Bomb = preload("res://Bomb/Bomb.tscn")
#item 
var item_speed
var grid
var list_bomb = []

# หาอันที่ใกล้สุด
var rock_min 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	var pa = get_parent()
#	print()	
	item_speed = 1
	grid = Singleton.grid
	hp = 3
	speed = 200
	range_bomb=1
	number_bomb=1
	number_current_bomb=0
	

	pass

func _process(delta):
	var Move = Vector2()
#	var body = Singleton.player[0]
	
#	print(Singleton.list_bomb)
#	print(body)
#	var body = 	get_node("body").get_overlapping_bodies()
#	print(body)
#
#	if(body.size() != 0):
#		for tings in body:
#			if(tings.is_in_group("Player")):
	
#				print(tings.global_position.x)
#				print(tings.global_position.x," and bot : ",self.global_position.x)

	if Singleton.list_rock.get_children().size()>0:
		rock_min = Singleton.list_rock.get_child(0)
#	print(rock_min)
		for N in Singleton.list_rock.get_children():
##		Singleton.list_rock.append(N)
			var wr =weakref(N)
			
			if wr.get_ref() != null :
#				print(Singleton.list_rock)
	#			print()
				if N.get_position().distance_to($Bot.get_position()) < rock_min.get_position().distance_to($Bot.get_position()) :
					rock_min = N
#	ตำแหน่ง หิน
#	print(Singleton.grid.is_cell_vacant(rock_min.get_position()))
	var pos_rock = Singleton.grid.is_cell_vacant(rock_min.get_position())
#	ตำแหน่ง bot
	var p = get_parent().get_child(6).get_node('Bot').get_position()
#	print(Singleton.grid.is_cell_vacant(p))
	var pos_bot=Singleton.grid.is_cell_vacant(p)
#	print(abs(pos_rock-pos_bot))
#	print(Vector2(abs(pos_rock.x-pos_bot.x),abs(pos_rock.y-pos_bot.y)))
	
	var pos_can_bomb = Vector2(abs(pos_rock.x-pos_bot.x),abs(pos_rock.y-pos_bot.y))
	

#	print(rock_min)
#
#	if(body.get_position().x<$Bot.get_position().x):
#		Move += Vector2(-1,0)
#	elif(body.get_position().x>$Bot.get_position().x):
#		Move += Vector2(1,0)
#	if(body.get_position().y<$Bot.get_position().y):
#		Move += Vector2(0,-1)
#	elif(body.get_position().y>$Bot.get_position().y):
#		Move += Vector2(0,1)
		

	if(rock_min.get_position().x<$Bot.get_position().x):
		Move += Vector2(-1,0)
	elif(rock_min.get_position().x>$Bot.get_position().x):
		Move += Vector2(1,0)
	if(rock_min.get_position().y<$Bot.get_position().y):
		Move += Vector2(0,-1)
	elif(rock_min.get_position().y>$Bot.get_position().y):
		Move += Vector2(0,1)
	
	if pos_can_bomb.x == 1 or pos_can_bomb.y == 1 :
		add_bomb()
		
#	if(rock_min != null):
#		var tangent = rock_min.get_position().distance_to($Bot.get_position()) 
#	print(tangent)

	Move = Move.normalized() * speed * delta
##	print(Move)
	$Bot.move_and_collide(Move)

	pass

func min_arr(arr):
    var min_val = arr[0]

    for i in range(1, arr.size()):
        min_val = min(min_val, arr[i])

    return min_val



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
		var g = s_grid.is_cell_vacant(get_parent().get_child(6).get_node('Bot').get_position())
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
		var g = s_grid.is_cell_vacant(get_parent().get_child(6).get_node('Bot').get_position())
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
				
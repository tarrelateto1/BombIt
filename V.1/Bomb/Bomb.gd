extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#var collision_H
#var collision_V
var time_boom =0
var count_bomb_top = 0
var count_bomb_right = 0
var count_bomb_down = 0
var count_bomb_left = 0
var max_bomb = 3
var find_wall_top = true
var find_wall_right = true
var find_wall_down = true
var find_wall_left = true
var shape = []
var count_area = 0

var collect_left_area = []
var collect_right_area=[]
var collect_top_area = []
var collect_down_area = []
var destory = []
var idx = 0
#var img = preload("res://Bomb/fire.tscn")
func _ready():
	Singleton.list_bomb.append(self)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	
#	print(get_node("CollisionShape2D"))
#	collision_H = get_node("Collision_H")
#	collision_V = get_node("Collision_V")

	
	pass

func _on_Timer_timeout():	
	time_boom +=0.1
#	print("bomb position : ",get_position())
#	print(time_boom)
	if time_boom > 2 && time_boom <3:
#		Horizontal up
#		var shape_H_top = RectangleShape2D.new()
#		shape_H_top.set_extents(Vector2(10,10))
#		var collision_H_top = CollisionShape2D.new()
#		Horizontal down
#		var shape_H_down = RectangleShape2D.new()
#		shape_H_down.set_extents(Vector2(10,10))
#		var collision_H_down = CollisionShape2D.new()
#		Verticle  LEFT
#		var shape_V_LEFT = RectangleShape2D.new()
#		shape_V_LEFT.set_extents(Vector2(10,10))
#		var collision_V_LEFT = CollisionShape2D.new()
#		Verticle Right
#		var shape_V_RIGHT = RectangleShape2D.new()
#		shape_V_RIGHT.set_extents(Vector2(10,10))
#		var collision_V_RIGHT = CollisionShape2D.new()
#

		
#		print(shape)

#		collision_V_RIGHT.set_shape(shape_V_RIGHT)
#		collision_V_RIGHT.position.x = 32
		
#		collision_V_LEFT.set_shape(shape_V_LEFT)
#		collision_V_LEFT.position.x = -32
#
#		collision_H_down.set_shape(shape_H_down)
#		collision_H_down.position.y = 32
#
#		collision_H_top.set_shape(shape_H_top)
#		collision_H_top.position.y = -32
		
		

#		add_child(collision_H_top)
#		add_child(collision_H_down)
#		add_child(collision_V_LEFT)
#		add_child(collision_V_RIGHT)
		# top
		if count_bomb_top < max_bomb && find_wall_top:
#			print(count_bomb_right)
			var shape_H_TOP = RectangleShape2D.new()
			shape_H_TOP.set_extents(Vector2(10,10))
			var collision_H_TOP = CollisionShape2D.new()
			collision_H_TOP.set_shape(shape_H_TOP)
			collision_H_TOP.position.y = -32*(count_bomb_top+1)
#			shape.append(collision_V_RIGHT)
			collect_top_area.append(count_area)
#			img.position.y = -32*(count_bomb_top+1)
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.jpg")
			img.position.y = -32*(count_bomb_top+1)
			img.set_scale(Vector2(0.035556,0.033333))
			add_child(img)
#			add_child(img)
#			if(colision_wall):	
#			print(collision_H_TOP)
			add_child(collision_H_TOP)
			count_area+=1	
			count_bomb_top+=1
#			shape[0].position.x = 32*2
		# RIGHT
		if count_bomb_right < max_bomb && find_wall_right:
#			print(count_bomb_right)
			var shape_V_RIGHT = RectangleShape2D.new()
			shape_V_RIGHT.set_extents(Vector2(10,10))
			var collision_V_RIGHT = CollisionShape2D.new()
			collision_V_RIGHT.set_shape(shape_V_RIGHT)
			collision_V_RIGHT.position.x = 32*(count_bomb_right+1)
#			shape.append(collision_V_RIGHT)
#			if(colision_wall):	
			collect_right_area.append(count_area)
#			print(collect_right_area)
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.jpg")
			img.position.x = 32*(count_bomb_right+1)
			img.set_scale(Vector2(0.035556,0.033333))
			add_child(img)
			add_child(collision_V_RIGHT)
			count_area+=1	
			count_bomb_right+=1
#			shape[0].position.x = 32*2
		#DOWN
		if count_bomb_down < max_bomb && find_wall_down:
#			print(count_bomb_right)
			var shape_H_DOWN = RectangleShape2D.new()
			shape_H_DOWN.set_extents(Vector2(10,10))
			var collision_H_DOWN = CollisionShape2D.new()
			collision_H_DOWN.set_shape(shape_H_DOWN)
			collision_H_DOWN.position.y = 32*(count_bomb_down+1)
#			shape.append(collision_V_RIGHT)
#			if(colision_wall):	
			collect_down_area.append(count_area)
			
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.jpg")
			img.position.y = 32*(count_bomb_down+1)
			img.set_scale(Vector2(0.035556,0.033333))
			add_child(img)
			
			add_child(collision_H_DOWN)
			count_area+=1	
			count_bomb_down+=1
		#LEFT
		if count_bomb_left < max_bomb && find_wall_left:
#			print(count_bomb_right)
			var shape_V_LEFT = RectangleShape2D.new()
			shape_V_LEFT.set_extents(Vector2(10,10))
			var collision_V_LEFT = CollisionShape2D.new()
			collision_V_LEFT.set_shape(shape_V_LEFT)
			collision_V_LEFT.position.x = -32*(count_bomb_left+1)
			shape.append(collision_V_LEFT)
#			print(shape)
#			if(colision_wall):	
			collect_left_area.append(count_area)
			print("collect in left ",collect_left_area)
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.jpg")
			img.position.x = -32*(count_bomb_left+1)
			img.set_scale(Vector2(0.035556,0.033333))
			add_child(img)
			
			add_child(collision_V_LEFT)
			count_area+=1	
			count_bomb_left+=1
		
	#destroy boom
	elif time_boom >3:
		
#		var idx = 0
#		print(destory)
##		queue_free()
#		for D in destory:
###		for L in Singleton.list_rock:
###
###			for D in destory:
#			for L in Singleton.list_rock:
##
###				print(D,"and",L)
####				print("rocks",Singleton.list_rock)
####				print("destory",destory)
###
#				if L == D:
#					print(D,"and",L)
###					print("โดนหิน")
###					print(L)
#					Singleton.list_rock.remove(idx)
#					L.queue_free()
####					if L != null:
###					Singleton.list_rock.remove(idx)
###					L.queue_free()
####						Singleton.list_rock.remove(idx)
#			idx +=1
#		print(Singleton.list_rock)
#		print(Singleton.list_bomb)
		get_tree().root.print_tree_pretty()
		queue_free()
		
	
	 # replace with function body


func _on_Bomb_body_entered(body):
	var idx = 0
	destory.append(body)
#	print("เจอ ",destory)
	
	for L in Singleton.list_rock:
	
		if L == body:
			print("โดนหิน")
			print(L)
			Singleton.list_rock.remove(idx)
			L.queue_free()
			print(Singleton.list_rock)
		idx +=1
#	print(Singleton.list_rock)	
	
#	for L in Singleton.list_wall:
#		if L == body:
#			find_wall_left = false
#			print("โดนกำแพง")
#			print(L)
#			L.queue_free()
#	print(Singleton.a)
#	body.queue_free()
#	print(body)
	pass # replace with function body




func _on_Bomb_body_shape_entered(body_id, body, body_shape, area_shape):
#	print(body)
#	print("area_shape : ",area_shape)
#	print(shape)
#	if area_shape == 0 :
	for k in collect_top_area:
		for L in Singleton.list_wall:
			if L == body&& k == area_shape:
				find_wall_top = false
				print("โดนกำแพง")
				print(L)	
#	if area_shape == 1 :
	for k in collect_right_area:
		for L in Singleton.list_wall:
			if L == body && k == area_shape:
				find_wall_right = false
				print("โดนกำแพง")
				print(L)	
#	if area_shape == 2 :
	for k in collect_down_area:
		for L in Singleton.list_wall:
			if L == body && k == area_shape:
				find_wall_down = false
				print("โดนกำแพง")
				print(L)	
				
#	if area_shape == 3 :
	for k in collect_left_area:
		for L in Singleton.list_wall:
			if L == body&& k ==area_shape:
				find_wall_left = false
				print("โดนกำแพงซ้าย ที่",area_shape ,"กับ ",k)
				print(L)	
				
#	check_wall(collect_top_area,find_wall_top,body,area_shape)
#	check_wall(collect_right_area,find_wall_right,body,area_shape)
#	check_wall(collect_down_area,find_wall_down,body,area_shape)
#	check_wall(collect_left_area,find_wall_left,body,area_shape)

func check_wall(collect,find_wall,body,area_shape):
	for k in collect:
		for L in Singleton.list_wall:
			if L == body&& k ==area_shape:
				find_wall = false
				print("โดนกำแพง ที่",area_shape ,"กับ ",k)
				print(L)	
	

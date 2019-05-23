extends Area2D


var time_boom =0
var count_bomb_top = 0
var count_bomb_right = 0
var count_bomb_down = 0
var count_bomb_left = 0
var max_bomb = 1
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
var attack = true
var boom = false
var player 

func _ready():
	

	
	pass

func _update(x):
	player = x


func _on_Timer_timeout():
	time_boom +=0.1
	
	

	if time_boom > 2 && time_boom <3:
		boom = true
		# top
		if count_bomb_top < max_bomb && find_wall_top:
#			print(count_bomb_right)
			var shape_H_TOP = RectangleShape2D.new()
			shape_H_TOP.set_extents(Vector2(10,9.749998))
			var collision_H_TOP = CollisionShape2D.new()
			collision_H_TOP.set_shape(shape_H_TOP)
			collision_H_TOP.position.y = -40*(count_bomb_top+1)
			collect_top_area.append(count_area)

			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.png")
			img.vframes = 4
			img.hframes = 7
			img.frame = 15
			img.position.y = -40*(count_bomb_top+1)
			img.set_scale(Vector2(0.501567,0.501567))
			add_child(img)
#			print(collision_H_TOP)
			add_child(collision_H_TOP)
			count_area+=1	
			count_bomb_top+=1
		print(find_wall_top)

		# RIGHT
		if count_bomb_right < max_bomb && find_wall_right:
#			print(count_bomb_right)
			var shape_V_RIGHT = RectangleShape2D.new()
			shape_V_RIGHT.set_extents(Vector2(10,9.749998))
			var collision_V_RIGHT = CollisionShape2D.new()
			collision_V_RIGHT.set_shape(shape_V_RIGHT)
			collision_V_RIGHT.position.x = 40*(count_bomb_right+1)
			collect_right_area.append(count_area)
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.png")
			img.vframes = 4
			img.hframes = 7
			img.frame = 16
			img.position.x = 40*(count_bomb_right+1)
			img.set_scale(Vector2(0.501567,0.501567))
			add_child(img)
			add_child(collision_V_RIGHT)
			count_area+=1	
			count_bomb_right+=1

		#DOWN
		if count_bomb_down < max_bomb && find_wall_down:
#			print(count_bomb_right)
			var shape_H_DOWN = RectangleShape2D.new()
			shape_H_DOWN.set_extents(Vector2(10,9.749998))
			var collision_H_DOWN = CollisionShape2D.new()
			collision_H_DOWN.set_shape(shape_H_DOWN)
			collision_H_DOWN.position.y = 40*(count_bomb_down+1)
			collect_down_area.append(count_area)
			
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.png")
			img.vframes = 4
			img.hframes = 7
			img.frame = 15
			img.position.y = 40*(count_bomb_down+1)
			img.set_scale(Vector2(0.501567,0.501567))
			add_child(img)
			
			add_child(collision_H_DOWN)
			count_area+=1	
			count_bomb_down+=1
		#LEFT
		if count_bomb_left < max_bomb && find_wall_left:
#			print(count_bomb_right)
			var shape_V_LEFT = RectangleShape2D.new()
			shape_V_LEFT.set_extents(Vector2(10,9.749998))
			var collision_V_LEFT = CollisionShape2D.new()
			collision_V_LEFT.set_shape(shape_V_LEFT)
			collision_V_LEFT.position.x = -40*(count_bomb_left+1)
			shape.append(collision_V_LEFT)
			collect_left_area.append(count_area)
			var img = Sprite.new()
			img.texture = load("res://Bomb/fire.png")
			img.vframes = 4
			img.hframes = 7
			img.frame = 16
			img.position.x = -40*(count_bomb_left+1)
			img.set_scale(Vector2(0.501567,0.501567))
			add_child(img)
			
			add_child(collision_V_LEFT)
			count_area+=1	
			count_bomb_left+=1
			var CENTER = RectangleShape2D.new()
			CENTER.set_extents(Vector2(10,9.749998))
			$CollisionShape2D.set_shape(CENTER)
			$Sprite.texture = load("res://Bomb/fire.png")
			$Sprite.set_scale(Vector2(0.501567,0.501567))
			$Sprite.vframes = 4
			$Sprite.hframes = 7
			$Sprite.frame = 14
			
			
		
	#destroy boom
	elif time_boom >3:
		
#		for D in destory:
#			for L in Singleton.list_rock.get_children():
#				if D == L:
#					L.queue_free()

		player.number_current_bomb -=1
#		print(player.number_current_bomb)
		queue_free()
		
	
	 # replace with function body


func _on_Bomb_body_entered(body):
	var idx = 0
	destory.append(body)	
	for L in Singleton.list_rock.get_children():
		if L == body:
#			print("โดนหิน")
#			print(L)
#			Singleton.list_rock.remove(idx)
#			Singleton.list_rock.remove(idx)
			L.queue_free()

		idx +=1

	pass # replace with function body




func _on_Bomb_body_shape_entered(body_id, body, body_shape, area_shape):
#	print(body)
	for k in collect_top_area:
		for L in Singleton.list_wall:
			if L == body&& k == area_shape:
				find_wall_top = false

#	if area_shape == 1 :
	for k in collect_right_area:
		for L in Singleton.list_wall:
			if L == body && k == area_shape:
				find_wall_right = false

#	if area_shape == 2 :
	for k in collect_down_area:
		for L in Singleton.list_wall:
			if L == body && k == area_shape:
				find_wall_down = false

				
#	if area_shape == 3 :
	for k in collect_left_area:
		for L in Singleton.list_wall:
			if L == body&& k ==area_shape:
				find_wall_left = false
#				print("โดนกำแพงซ้าย ที่",area_shape ,"กับ ",k)
#				print(L)	
	if boom:
		if attack :
			if body == Singleton.player1:
				if Singleton.player1.shield >0 :
					Singleton.player1.shield -=1
				else :
					Singleton.player1.hp -=1
				
	#			print(1)
				attack = false
			if body == Singleton.player2:
				if Singleton.player2.shield >0 :
					Singleton.player2.shield -=1
				else :
					Singleton.player2.hp -=1
				print(Singleton.player2.shield)
				attack = false
	

# ยังไม่ได้ใช้
func check_wall(collect,find_wall,body,area_shape):
	for k in collect:
		for L in Singleton.list_wall:
			if L == body&& k ==area_shape:
				find_wall = false




func _on_Bomb_body_exited(body):
	if body == Singleton.player1:
		var kine = KinematicBody2D.new()
		var cannt_move = RectangleShape2D.new()
		cannt_move.set_extents(Vector2(10,10))
		var col_move = CollisionShape2D.new()
		col_move.set_shape(cannt_move)
		kine.add_child(col_move)
		add_child(kine)

		
#		Singleton.player.move = false
	if body == Singleton.player2:
		var kine = KinematicBody2D.new()
		var cannt_move = RectangleShape2D.new()
		cannt_move.set_extents(Vector2(10,10))
		var col_move = CollisionShape2D.new()
		col_move.set_shape(cannt_move)
		kine.add_child(col_move)
		add_child(kine)
		pass
#		Singleton.player.move = false
	pass # replace with function body

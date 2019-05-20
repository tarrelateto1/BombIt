extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 150
var rock_min 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	var pa = get_parent()
#	print()	
	

	pass

func _process(delta):
	var Move = Vector2()
	var body = Singleton.player[0]
	
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

	if Singleton.list_rock.size()>0:
		rock_min = Singleton.list_rock[0]
#	print(rock_min)
		for N in Singleton.list_rock:
##		Singleton.list_rock.append(N)
#			print(Singleton.list_rock)
			
			if N.get_position().distance_to($Bot.get_position()) < rock_min.get_position().distance_to($Bot.get_position()) :
				rock_min = N
			
	
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
		
		if(rock_min != null):
			if(rock_min.get_position().x<$Bot.get_position().x):
				Move += Vector2(-1,0)
			elif(rock_min.get_position().x>$Bot.get_position().x):
				Move += Vector2(1,0)
			if(rock_min.get_position().y<$Bot.get_position().y):
				Move += Vector2(0,-1)
			elif(rock_min.get_position().y>$Bot.get_position().y):
				Move += Vector2(0,1)
		
#	if(rock_min != null):
#		var tangent = rock_min.get_position().distance_to($Bot.get_position()) 
#	print(tangent)

	Move = Move.normalized() * speed * delta
#	print(Move)
	$Bot.move_and_collide(Move)

	pass

func min_arr(arr):
    var min_val = arr[0]

    for i in range(1, arr.size()):
        min_val = min(min_val, arr[i])

    return min_val
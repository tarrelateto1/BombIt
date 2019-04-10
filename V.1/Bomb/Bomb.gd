extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#var collision_H
#var collision_V
var time_boom =0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
#	print(get_node("CollisionShape2D"))
#	collision_H = get_node("Collision_H")
#	collision_V = get_node("Collision_V")

	
	pass

func _on_Timer_timeout():	
	time_boom +=1
	print("bomb position : ",get_position())
#	print(time_boom)
	if time_boom == 3:
#		Horizontal up
		var shape_H_top = RectangleShape2D.new()
		shape_H_top.set_extents(Vector2(10,10))
		var collision_H_top = CollisionShape2D.new()
#		Horizontal down
		var shape_H_down = RectangleShape2D.new()
		shape_H_down.set_extents(Vector2(10,10))
		var collision_H_down = CollisionShape2D.new()
#		Verticle  LEFT
		var shape_V_LEFT = RectangleShape2D.new()
		shape_V_LEFT.set_extents(Vector2(10,10))
		var collision_V_LEFT = CollisionShape2D.new()
#		Verticle Right
		var shape_V_RIGHT = RectangleShape2D.new()
		shape_V_RIGHT.set_extents(Vector2(10,10))
		var collision_V_RIGHT = CollisionShape2D.new()
		
		var shape = []
		shape.append(shape_H_top)
		shape.append(shape_H_down)
		shape.append(shape_V_RIGHT)
		shape.append(shape_V_LEFT)
		print(shape)

		collision_V_RIGHT.set_shape(shape_V_RIGHT)
		collision_V_RIGHT.position.x = 32
		
		collision_V_LEFT.set_shape(shape_V_RIGHT)
		collision_V_LEFT.position.x = -32
		
		collision_H_down.set_shape(shape_V_RIGHT)
		collision_H_down.position.y = 32
		
		collision_H_top.set_shape(shape_V_RIGHT)
		collision_H_top.position.y = -32
		
		
#		add_child(collision_H_top)
		add_child(collision_H_top)
		add_child(collision_H_down)
		add_child(collision_V_LEFT)
		add_child(collision_V_RIGHT)
	#	print(Singleton.a)
	#	self.queue_free()
	#destroy boom
	elif time_boom >3:
		queue_free()
	
	 # replace with function body


func _on_Bomb_body_entered(body):
	for L in Singleton.list_rock:
		if L == body:
			L.queue_free()
#	print(Singleton.a)
#	body.queue_free()
#	print(body)
	pass # replace with function body

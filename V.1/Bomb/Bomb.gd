extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var collision
var time_boom =0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	print(get_node("CollisionShape2D"))
	collision = get_node("CollisionShape2D")
	
	pass

func _on_Timer_timeout():	
	time_boom +=1
	print(time_boom)
	if time_boom == 3:
		var shape = RectangleShape2D.new()
		shape.set_extents(Vector2(70,5))
		collision.set_shape(shape)
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

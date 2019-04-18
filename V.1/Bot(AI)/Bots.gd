extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 150

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	var pa = get_parent()
#	print()	
	pass

func _process(delta):
	var Move = Vector2()
	var body = Singleton.player
#	var body = 	get_node("body").get_overlapping_bodies()
#	print(body)
	if(body.size() != 0):
		for tings in body:
			if(tings.is_in_group("Player")):
#				print(tings.global_position.x)
#				print(tings.global_position.x," and bot : ",self.global_position.x)
				if(tings.global_position.x<self.global_position.x):
					Move += Vector2(-1,0)
				if(tings.global_position.x>self.global_position.x):
					Move += Vector2(1,0)
				if(tings.global_position.y<self.global_position.y):
					Move += Vector2(0,-1)
				if(tings.global_position.y>self.global_position.y):
					Move += Vector2(0,1)

	Move = Move.normalized() * speed * delta
	print(Move)
	$Bot.move_and_collide(Move)

	pass

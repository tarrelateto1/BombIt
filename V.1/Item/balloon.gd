extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	if body == Singleton.player2:
		Singleton.player2.number_bomb += 1
		print("player2")
		queue_free()
	elif body == Singleton.player1:
		Singleton.player1.number_bomb += 1
		print("player1")
		queue_free()
	pass # replace with function body

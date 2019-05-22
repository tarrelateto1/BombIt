extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hp 
var speed 
var range_bomb
var number_bomb
var number_current_bomb

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hp = 3
	speed = 200
	range_bomb=1
	number_bomb=1
	number_current_bomb=0
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

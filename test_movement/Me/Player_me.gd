extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 0
const MAX_SPEED = 400
var velocity = Vector2()
var type
var grid

var direction = Vector2()
const TOP =Vector2(0,-1)
const DOWN = Vector2(0,1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)

var is_moving = false
var target_pos = Vector2()
var target_direction = Vector2()


func _ready():
	grid = get_parent()
	type = get_parent().get_node("Player")
	print(type)
	print(grid)
	
	get_tree().root.print_tree_pretty()
#	type = get_parent().Player
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	var is_moving = Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT)
	direction = Vector2()  
#	if is_moving :
#		speed = MAX_SPEED
	if Input.is_key_pressed(KEY_UP):
#		direction += TOP
		direction.y = -1
	elif Input.is_key_pressed(KEY_DOWN):
#			direction += DOWN
		direction.y = 1
	elif Input.is_key_pressed(KEY_LEFT):
#			direction += LEFT
		direction.x = -1
	elif Input.is_key_pressed(KEY_RIGHT):
#			direction += RIGHT
		direction.x = 1
		
	if direction !=Vector2():
		speed = MAX_SPEED
	else:
		speed = 0
	
#	valocity.x = Input.is_key_pressed(KEY_RIGHT) - Input.is_key_pressed(KEY_LEFT)
#	valocity.y = Input.is_key_pressed(KEY_DOWN) - Input.is_key_pressed(KEY_UP)
#	valocity = valocity.normalized() * MAX_SPEED 
#
	
#	var target_pos = grid.update_child_pos(self)
#	set_position(target_pos)
	
#	var velocity = speed *direction *delta
#	move_and_collide(velocity)
	
	if not is_moving and direction !=Vector2():
		target_direction = direction
		if grid.is_cell_vacant(get_position(), target_direction):
			target_pos = grid.update_child_pos(self)
			is_moving = true
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed*target_direction*delta
		
		var pos = get_position()
		var distance_to_target = Vector2(abs(target_pos.x - pos.x),abs(target_pos.y-pos.y))
		
		if abs(velocity.x) >distance_to_target.x:
			velocity.x = distance_to_target.x * target_direction.x
			is_moving = false
		if abs(velocity.y) >distance_to_target.y:
			velocity.y = distance_to_target.y * target_direction.y
			is_moving = false
			
		move_and_collide(velocity)
#	pass

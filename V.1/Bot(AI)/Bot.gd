extends KinematicBody2D

const speed = 200

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var v = Vector2()
	var randorm_action = randi()%4
	if randorm_action == 0:
		v.x = -speed

	elif randorm_action == 1:
		v.x = speed

	if randorm_action == 2:
		v.y = -speed

	elif randorm_action == 3:
		v.y = speed

		
		
	
	var ds = v * delta
	if ds != Vector2(0,0):
		move_and_slide(Vector2(-1000,0)*delta)
	if is_on_wall():
		print("ffff")

#	if Input.is_key_pressed(KEY_SPACE):
#		var bomb = Bomb.instance()
#		bomb.scale = Vector2(1,1)
#		bomb.z_index = -1
#		var g = grid.is_cell_vacant($Player.get_position())
#		bomb.position = Vector2((g.x*$TileMap.cell_size.x)+$TileMap.cell_size.x/2,(g.y*$TileMap.cell_size.y)+$TileMap.cell_size.y/2)
#		add_child(bomb)

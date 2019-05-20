



extends Node2D



var spritedir = "down"
#var Loadplayer = preload("res://Player/Player.tscn")
var Bomb = preload("res://Bomb/Bomb.tscn")
var list_bomb = []
var list_rock = []

onready var player = get_node("Player")

var grid

func _ready():
	Singleton.list_bomb.append(self)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Singleton.player1 = $Player
	Singleton.player2 = $Player2
#	player.position = Vector2(170,70)
#	print(player.get_node("Sprite"))
#	add_child(player)
#	get_tree().root.print_tree_pretty()
#	player.print_tree_pretty()
	Singleton.player.append(player)
#	Singleton.player.append(player)
#	var Rocks = get_node("rocks")
	
	for N in get_node("rocks").get_children():
		Singleton.list_rock.append(N)
#	Singleton.list_rock[0].queue_free()
#	print(Singleton.list_rock)
	grid = get_node("TileMap")
	for N in get_node("wall").get_children():
		Singleton.list_wall.append(N)
	
#	for n in Singleton.list_rock:
#		print(n)
	
#	speed = Singleton.speed
	

func _process(delta):

#	$Control/Label.text = "Player 1 = position " + String($Player.get_position().x) + " " + String($Player.get_position().y) 
	var v = Vector2()
	
#	if Input.is_key_pressed(KEY_LEFT):
	if Input.is_action_pressed("ui_left"):
		v.x = -Singleton.player1.speed
		spritedir = "left"
#	elif Input.is_key_pressed(KEY_RIGHT):
	elif Input.is_action_pressed("ui_right"):
		v.x = Singleton.player1.speed
		spritedir = "right"
#	elif Input.is_key_pressed(KEY_UP):
	elif Input.is_action_pressed("ui_up"):
		v.y = -Singleton.player1.speed
		spritedir = "up"
#	elif Input.is_key_pressed(KEY_DOWN):
	elif Input.is_action_pressed("ui_down"):
		v.y = Singleton.player1.speed
		spritedir = "down"
		
		
	
	var ds = v * delta
	if ds != Vector2(0,0):
#		if(Singleton.move_c):
			$Player.move_and_collide(v*delta)
			
			
	var v1 = Vector2()
	
	if Input.is_key_pressed(KEY_LEFT):
#	if Input.is_action_pressed("ui_left"):
		v1.x = -Singleton.player2.speed
		spritedir = "left"
	elif Input.is_key_pressed(KEY_RIGHT):
#	elif Input.is_action_pressed("ui_right"):
		v1.x = Singleton.player2.speed
		spritedir = "right"
	elif Input.is_key_pressed(KEY_UP):
#	elif Input.is_action_pressed("ui_up"):
		v1.y = -Singleton.player2.speed
		spritedir = "up"
	elif Input.is_key_pressed(KEY_DOWN):
#	elif Input.is_action_pressed("ui_down"):
		v1.y = Singleton.player2.speed
		spritedir = "down"
		
		
	
	var ds1 = v1 * delta
	if ds1 != Vector2(0,0):
#		if(Singleton.move_c):
			$Player2.move_and_collide(v1*delta)
		
#		print($Player.get_position())
#		anim_switch("walk")
#	print("x= ",$Player.get_position().x ,"  y=",$Player.get_position().y)
#	print($Player.get_position().x)
#	print($Player.x)

	
#	$Player.translate(v*delta)
#	anim_switch("walk")

func _input(event):
	
#	if Input.is_key_pressed(KEY_LEFT) :
	if Input.is_action_pressed("ui_left"):
#		spritedir = "left"
		anim_switch("walkleft")
#	elif Input.is_key_pressed(KEY_RIGHT) :
	elif Input.is_action_pressed("ui_right"):
#		spritedir = "right"
		anim_switch("walkright")
#	if Input.is_key_pressed(KEY_UP) :
	elif Input.is_action_pressed("ui_up"):
#		spritedir = "up"
		anim_switch("walkup")
#	elif Input.is_key_pressed(KEY_DOWN):
	elif Input.is_action_pressed("ui_down"):
#		spritedir = "down"
		anim_switch("walkdown")	
		
#	if Input.is_key_pressed(KEY_SPACE):
	if Input.is_action_pressed("Bomb"):
		
		var bomb = Bomb.instance()
		
		bomb.max_bomb = Singleton.player1.range_bomb 
		
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		var g = grid.is_cell_vacant($Player.get_position())
#		bomb.position = Vector2(170,70)
		bomb.position = Vector2((g.x*$TileMap.cell_size.x)+$TileMap.cell_size.x/2,(g.y*$TileMap.cell_size.y)+$TileMap.cell_size.y/2)
#		bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
		add_child(bomb)
#		print(bomb.get_position())
#		var g = grid.is_cell_vacant(bomb.get_position())
		
#		var grid
#		var target_pos
#		grid = $TileMap
##		target_pos = grid.update_child_pos(self)
#		target_pos = grid.update_child_pos($Player)
#		var pos = get_position()
#		var distance_to_target = Vector2(abs(target_pos.x - pos.x),abs(target_pos.y-pos.y))
#		print(distance_to_target)
#		print(bomb.position)
#		list_bomb.append(bomb)
#		get_tree().root.print_tree_pretty()


#####player2
	if Input.is_key_pressed(KEY_LEFT) :
#	if Input.is_action_pressed("ui_left"):
#		spritedir = "left"
		anim_switch("walkleft")
	elif Input.is_key_pressed(KEY_RIGHT) :
#	elif Input.is_action_pressed("ui_right"):
#		spritedir = "right"
		anim_switch("walkright")
	if Input.is_key_pressed(KEY_UP) :
#	elif Input.is_action_pressed("ui_up"):
#		spritedir = "up"
		anim_switch("walkup")
	elif Input.is_key_pressed(KEY_DOWN):
#	elif Input.is_action_pressed("ui_down"):
#		spritedir = "down"
		anim_switch("walkdown")	
		
	if Input.is_key_pressed(KEY_SPACE):
#	if Input.is_action_pressed("Bomb"):
		
		var bomb1 = Bomb.instance()
		
#		bomb1.tttt(1)
		
		bomb1.max_bomb = Singleton.player2.range_bomb 
		
		bomb1.scale = Vector2(1,1)
		bomb1.z_index = -1
		var g1 = grid.is_cell_vacant($Player2.get_position())
#		bomb.position = Vector2(170,70)
		bomb1.position = Vector2((g1.x*$TileMap.cell_size.x)+$TileMap.cell_size.x/2,(g1.y*$TileMap.cell_size.y)+$TileMap.cell_size.y/2)
#		bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
		add_child(bomb1)
		
	pass
#
func anim_switch(animation):
#	var newanim = str(animation,spritedir)
	if player.get_node("AnimationPlayer").current_animation != "":
#		player.get_node("AnimationPlayer").play(newanim)
		player.get_node("AnimationPlayer").play(animation)


	


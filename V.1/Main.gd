



extends Node2D


const speed = 200
var spritedir = "down"
#var Loadplayer = preload("res://Player/Player.tscn")
var Bomb = preload("res://Bomb/Bomb.tscn")
var list_bomb = []
var list_rock = []

onready var player = get_node("Player")

var grid

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
#	player.position = Vector2(170,70)
#	print(player.get_node("Sprite"))
#	add_child(player)
#	get_tree().root.print_tree_pretty()
#	player.print_tree_pretty()
	Singleton.player.append(player)
	Singleton.player.append(player)
	var Rocks = get_node("rocks")
	
	for N in get_node("rocks").get_children():
		Singleton.list_rock.append(N)
	grid = get_node("TileMap")
	for N in get_node("wall").get_children():
		Singleton.list_wall.append(N)
#	for n in Singleton.list_rock:
#		print(n)
	
	
	

func _process(delta):
#	$Control/Label.text = "Player 1 = position " + String($Player.get_position().x) + " " + String($Player.get_position().y) 
	var v = Vector2()
	if Input.is_key_pressed(KEY_LEFT):
		v.x = -speed
		spritedir = "left"
	elif Input.is_key_pressed(KEY_RIGHT):
		v.x = speed
		spritedir = "right"
	if Input.is_key_pressed(KEY_UP):
		v.y = -speed
		spritedir = "up"
	elif Input.is_key_pressed(KEY_DOWN):
		v.y = speed
		spritedir = "down"
		
		
	
	var ds = v * delta
	if ds != Vector2(0,0):
		$Player.move_and_collide(v*delta)
#		print($Player.get_position())
#		anim_switch("walk")
#	print("x= ",$Player.get_position().x ,"  y=",$Player.get_position().y)
#	print($Player.get_position().x)
#	print($Player.x)

	
#	$Player.translate(v*delta)
#	anim_switch("walk")

func _input(event):
	
	if Input.is_key_pressed(KEY_LEFT) :
#		spritedir = "left"
		anim_switch("walkleft")
	elif Input.is_key_pressed(KEY_RIGHT) :
#		spritedir = "right"
		anim_switch("walkright")
	if Input.is_key_pressed(KEY_UP) :
#		spritedir = "up"
		anim_switch("walkup")
	elif Input.is_key_pressed(KEY_DOWN):
#		spritedir = "down"
		anim_switch("walkdown")	
		
	if Input.is_key_pressed(KEY_SPACE):
		var bomb = Bomb.instance()
		
		
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		var g = grid.is_cell_vacant($Player.get_position())
#		bomb.position = Vector2(170,70)
		bomb.position = Vector2((g.x*$TileMap.cell_size.x)+$TileMap.cell_size.x/2,(g.y*$TileMap.cell_size.y)+$TileMap.cell_size.y/2)
#		bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
		add_child(bomb)
		print(bomb.get_position())
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
		
	pass
#
func anim_switch(animation):
#	var newanim = str(animation,spritedir)
	if player.get_node("AnimationPlayer").current_animation != "":
#		player.get_node("AnimationPlayer").play(newanim)
		player.get_node("AnimationPlayer").play(animation)


	


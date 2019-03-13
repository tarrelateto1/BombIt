extends Node2D


const speed = 200
var spritedir = "down"
var Loadplayer = preload("res://Player/Player.tscn")
var Bomb = preload("res://Bomb/Bomb.tscn")
var list_bomb = []
var list_rock = []

var player = Loadplayer.instance()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	player.position = Vector2(170,70)
#	print(player.get_node("Sprite"))
	add_child(player)
	get_tree().root.print_tree_pretty()
#	player.print_tree_pretty()
	
	var Rocks = get_node("rocks")
	
	for N in get_node("rocks").get_children():
		Singleton.list_rock.append(N)
	
#	for n in Singleton.list_rock:
#		print(n)
	
	
	

func _process(delta):
	
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
		
#		anim_switch("walk")
#	print("x= ",$Player.get_position().x ,"  y=",$Player.get_position().y)
#	print($Player.get_position().x)
#	print($Player.x)

	
#	$Player.translate(v*delta)
#	anim_switch("walk")

func _input(event):
	
	if Input.is_key_pressed(KEY_LEFT) && !event.echo:
#		spritedir = "left"
		anim_switch("walkleft")
	elif Input.is_key_pressed(KEY_RIGHT) && !event.echo:
#		spritedir = "right"
		anim_switch("walkright")
	if Input.is_key_pressed(KEY_UP) && !event.echo:
#		spritedir = "up"
		anim_switch("walkup")
	elif Input.is_key_pressed(KEY_DOWN)&& !event.echo:
#		spritedir = "down"
		anim_switch("walkdown")	
		
	if Input.is_key_pressed(KEY_SPACE):
		var bomb = Bomb.instance()
		
		
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
		add_child(bomb)
#		list_bomb.append(bomb)
		get_tree().root.print_tree_pretty()
		
	pass
#
func anim_switch(animation):
#	var newanim = str(animation,spritedir)
	if player.get_node("AnimationPlayer").current_animation != "":
#		player.get_node("AnimationPlayer").play(newanim)
		player.get_node("AnimationPlayer").play(animation)


	


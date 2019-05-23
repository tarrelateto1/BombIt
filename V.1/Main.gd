



extends Node2D



var spritedir = "down"
var Bomb = preload("res://Bomb/Bomb.tscn")
var Bomb1 = preload("res://Bomb/Bomb.tscn")
var list_bomb = []
var list_rock = []

onready var player = get_node("Player")

var grid

func _ready():
	Singleton.list_bomb.append(self)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Singleton.player1 = $Player
	print(Singleton.player1)
	Singleton.player2 = $Player2
	
	Singleton.player.append(player)
	
	for N in get_node("rocks").get_children():
		Singleton.list_rock.append(N)

	Singleton.grid = get_node("TileMap")
	grid = get_node("TileMap")
	for N in get_node("wall").get_children():
		Singleton.list_wall.append(N)


func _process(delta):
	update_player1()
	update_player2()

	var v = Vector2()
	

	if Input.is_action_pressed("ui_left"):
		v.x = -Singleton.player1.speed
		spritedir = "left"

	elif Input.is_action_pressed("ui_right"):
		v.x = Singleton.player1.speed
		spritedir = "right"

	elif Input.is_action_pressed("ui_up"):
		v.y = -Singleton.player1.speed
		spritedir = "up"

	elif Input.is_action_pressed("ui_down"):
		v.y = Singleton.player1.speed
		spritedir = "down"
		
		
	
	var ds = v * delta
	if ds != Vector2(0,0):

		$Player.move_and_collide(v*delta)
			
			
	var v1 = Vector2()
	
	if Input.is_key_pressed(KEY_LEFT):
		v1.x = -Singleton.player2.speed
		spritedir = "left"
	elif Input.is_key_pressed(KEY_RIGHT):
		v1.x = Singleton.player2.speed
		spritedir = "right"
	elif Input.is_key_pressed(KEY_UP):
		v1.y = -Singleton.player2.speed
		spritedir = "up"
	elif Input.is_key_pressed(KEY_DOWN):
		v1.y = Singleton.player2.speed
		spritedir = "down"
		
		
	
	var ds1 = v1 * delta
	if ds1 != Vector2(0,0):

			$Player2.move_and_collide(v1*delta)

func _input(event):
	

	if Input.is_action_pressed("ui_left"):

		anim_switch("walkleft")

	elif Input.is_action_pressed("ui_right"):

		anim_switch("walkright")

	elif Input.is_action_pressed("ui_up"):

		anim_switch("walkup")

	elif Input.is_action_pressed("ui_down"):

		anim_switch("walkdown")	
		

	if Input.is_action_pressed("Bomb"):
		
#		if Singleton.player1.number_current_bomb < Singleton.player1.number_bomb:
			
		Singleton.player1.add_bomb()
	

#####player2
	if Input.is_key_pressed(KEY_LEFT) :
		anim_switch("walkleft")
	elif Input.is_key_pressed(KEY_RIGHT) :
		anim_switch("walkright")
	if Input.is_key_pressed(KEY_UP) :

		anim_switch("walkup")
	elif Input.is_key_pressed(KEY_DOWN):

		print("current:",Singleton.player2.number_current_bomb)
		print("number_bomb:",Singleton.player2.number_bomb)
		anim_switch("walkdown")	
		
	if Input.is_key_pressed(KEY_SPACE):

		if Singleton.player2.number_current_bomb < Singleton.player2.number_bomb:
			Singleton.player2.add_bomb()

	pass
#
func anim_switch(animation):

	if player.get_node("AnimationPlayer").current_animation != "":

		player.get_node("AnimationPlayer").play(animation)

func update_player1():
	get_node("Control/Player1/hp").text = String($Player.hp)
	get_node("Control/Player1/fire").text = String($Player.range_bomb)
	get_node("Control/Player1/num_bomb").text = String($Player.number_bomb)
	get_node("Control/Player1/speed").text = String($Player.item_speed)
	pass

func update_player2():
	get_node("Control/Player2/hp2").text = String($Player2.hp)
	get_node("Control/Player2/fire2").text = String($Player2.range_bomb)
	get_node("Control/Player2/num_bomb2").text = String($Player2.number_bomb)
	get_node("Control/Player2/speed2").text = String($Player2.item_speed)
	

	


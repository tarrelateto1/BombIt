extends Node2D

var Bomb = preload("res://Bomb/Bomb.tscn")
const speed = 200
func _ready():
	
	pass

func _process(delta):
	var v = Vector2()
	if Input.is_key_pressed(KEY_LEFT):
		v.x = -speed
#		spritedir = "left"
	elif Input.is_key_pressed(KEY_RIGHT):
		v.x = speed
#		spritedir = "right"
	if Input.is_key_pressed(KEY_UP):
		v.y = -speed
#		spritedir = "up"
	elif Input.is_key_pressed(KEY_DOWN):
		v.y = speed
#		spritedir = "down"

	#	var tile_pos = TileMap.world_to_map(get_position())
#	print(tile_pos)
#    var cell = map.get_cell(tile_pos.x, tile_pos.y)
		
	
	var ds = v * delta
	if ds != Vector2(0,0):
		$Player.move_and_collide(v*delta)
		
	if Input.is_key_pressed(KEY_SPACE):
		var bomb = Bomb.instance()
		
		
		bomb.scale = Vector2(1,1)
		bomb.z_index = -1
		bomb.position = Vector2($Player.get_position().x,$Player.get_position().y)
		add_child(bomb)
		
	
extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var AddBomb = preload("res://Item/AddBomb.gd")
var balloon = preload("res://Item/balloon.gd")
var BootSpeed = preload("res://Item/BootSpeed.gd")
var Heart = preload("res://Item/Heart.gd")
var shield = preload("res://Item/shield.gd")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func delete():

#	print("สุ่ม",randi() % 10)
	var xx =405.5
	var kk =Vector2(xx,80)
	var x= randi()%10
	match x:
		1:
			var AddBomb = preload("res://Item/AddBomb.tscn")
			var k = AddBomb.instance()
			var s_grid = Singleton.grid
			var g =s_grid.is_cell_vacant(self.get_position()+kk)
			k.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
#			k.position.x+=xx
#			k.position.y+=80
			Singleton.main.add_child(k)
		2:
			var balloon = preload("res://Item/balloon.tscn")
			var k = balloon.instance()
			var s_grid = Singleton.grid
			var g =s_grid.is_cell_vacant(self.get_position()+kk)
			
			k.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
#			k.position.x+=xx
#			k.position.y+=80
			Singleton.main.add_child(k)
		3:
			var BootSpeed = preload("res://Item/BootSpeed.tscn")
			var k = BootSpeed.instance()
			var s_grid = Singleton.grid
			var g =s_grid.is_cell_vacant(self.get_position()+kk)
			k.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
#			k.position.x+=xx
#			k.position.y+=80
			Singleton.main.add_child(k)
		4:
			var Heart = preload("res://Item/Heart.tscn")
			var k = Heart.instance()
			var s_grid = Singleton.grid
			var g =s_grid.is_cell_vacant(self.get_position()+kk)
			k.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
#			k.position.x+=xx
#			k.position.y+=80
			Singleton.main.add_child(k)
		5:
			var shield = preload("res://Item/shield.tscn")
			var k = shield.instance()
			var s_grid = Singleton.grid
			var g =s_grid.is_cell_vacant(self.get_position()+kk)
			k.position = Vector2((g.x*s_grid.cell_size.x)+s_grid.cell_size.x/2,(g.y*s_grid.cell_size.y)+s_grid.cell_size.y/2)
#			k.position.x+=xx
#			k.position.y+=80
			Singleton.main.add_child(k)
		_:
			print("not have")
	self.queue_free()



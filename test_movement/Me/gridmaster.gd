extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var grid = get_parent()

func _ready():
#	set_opacity(0.2)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_gridmaster_draw():
	var LINE_COLOR = Color(255, 255, 255)
	var LINE_WIDTH = 2
	var window_size = OS.get_window_size()

	for x in range(grid.grid_size.x + 1):
		var col_pos = x * grid.tile_size.x
		var limit = grid.grid_size.y * grid.tile_size.y
		draw_line(Vector2(col_pos, 0), Vector2(col_pos, limit), LINE_COLOR, LINE_WIDTH)
	for y in range(grid.grid_size.y + 1):
		var row_pos = y * grid.tile_size.y
		var limit = grid.grid_size.x * grid.tile_size.x
		draw_line(Vector2(0, row_pos), Vector2(limit, row_pos), LINE_COLOR, LINE_WIDTH)
#	pass # replace with function body

# Board.gd - Board rendering and tile management
extends Node2D

var game_manager
var tile_scenes = {}
var tiles_visual = []

func _ready():
	game_manager = get_node("/root/Game")
	build_board()

func build_board():
	# Create visual tiles for all 40 positions
	for i in range(40):
		var tile = Constants.TILES[i]
		var grid_pos = get_grid_position(i)
		var tile_visual = create_tile_visual(tile, grid_pos)
		add_child(tile_visual)
		tiles_visual.append(tile_visual)

func get_grid_position(pos: int) -> Vector2:
	# Convert tile position to grid coordinates
	var row = 0
	var col = 0
	
	if pos <= 10:
		row = 10
		col = 10 - pos
	elif pos <= 19:
		row = 10 - (pos - 10)
		col = 0
	elif pos <= 30:
		row = 0
		col = pos - 20
	else:
		row = pos - 30
		col = 10
	
	return Vector2(col * 64, row * 64)

func create_tile_visual(tile: Dictionary, pos: Vector2) -> Node2D:
	var tile_node = Node2D.new()
	tile_node.position = pos
	tile_node.add_to_group("tiles")
	
	var rect = ColorRect.new()
	rect.size = Vector2(64, 64)
	rect.color = get_tile_color(tile)
	tile_node.add_child(rect)
	
	var label = Label.new()
	label.text = tile["name"].substr(0, 8)
	label.add_theme_font_size_override("font_size", 8)
	tile_node.add_child(label)
	
	return tile_node

func get_tile_color(tile: Dictionary) -> Color:
	if tile["type"] == "start":
		return Color(0.05, 0.2, 0.05)
	elif tile["type"] == "jail":
		return Color(0.1, 0.1, 0.1)
	elif tile["type"] == "free":
		return Color(0.02, 0.04, 0.1)
	elif tile["group"] in Constants.GROUP_COLORS:
		return Color(Constants.GROUP_COLORS[tile["group"]])
	else:
		return Color(0.05, 0.05, 0.05)

func update_tile_owner(tile_id: int, owner_id: int):
	if tile_id < tiles_visual.size():
		var player = game_manager.players[owner_id]
		var tile_visual = tiles_visual[tile_id]
		var rect = tile_visual.get_child(0)
		if rect:
			rect.color = Color(player["character"]["color"])

func highlight_tile(tile_id: int):
	if tile_id < tiles_visual.size():
		tiles_visual[tile_id].modulate = Color.YELLOW

func unhighlight_tile(tile_id: int):
	if tile_id < tiles_visual.size():
		tiles_visual[tile_id].modulate = Color.WHITE

# GameUI.gd - UI management and player panel
extends CanvasLayer

var game_manager
var player_panels = []

func _ready():
	game_manager = get_node("/root/Game")
	create_ui()

func create_ui():
	var container = VBoxContainer.new()
	container.anchors_right = 1.0
	container.anchors_bottom = 1.0
	add_child(container)
	
	# Header
	var header = HBoxContainer.new()
	var title = Label.new()
	title.text = "OPULENCE - The India Property Game"
	title.add_theme_font_size_override("font_size", 24)
	header.add_child(title)
	container.add_child(header)
	
	# Player panels
	for i in range(game_manager.players.size()):
		var panel = create_player_panel(i)
		player_panels.append(panel)
		container.add_child(panel)

func create_player_panel(player_id: int) -> PanelContainer:
	var player = game_manager.players[player_id]
	var panel = PanelContainer.new()
	
	var vbox = VBoxContainer.new()
	
	var name_label = Label.new()
	name_label.text = "%s %s - Balance: %s" % [
		player["character"]["token"],
		player["name"],
		Constants.format_money(player["money"])
	]
	vbox.add_child(name_label)
	
	var properties_label = Label.new()
	properties_label.text = "Properties: %d" % player["properties"].size()
	vbox.add_child(properties_label)
	
	panel.add_child(vbox)
	return panel

func update_player_panel(player_id: int):
	if player_id < player_panels.size():
		var player = game_manager.players[player_id]
		var label = player_panels[player_id].get_child(0).get_child(0)
		if label:
			label.text = "%s %s - Balance: %s" % [
				player["character"]["token"],
				player["name"],
				Constants.format_money(player["money"])
			]

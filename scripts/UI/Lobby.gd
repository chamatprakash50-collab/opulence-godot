# Lobby.gd - Game setup and player configuration
extends Control

var game_manager
var player_slots = []
var num_players = 4

func _ready():
	game_manager = get_tree().root.get_node("GameManager")
	setup_ui()

func setup_ui():
	var vbox = VBoxContainer.new()
	vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL
	add_child(vbox)
	
	# Title
	var title = Label.new()
	title.text = "🎮 CUSTOM GAME SETUP"
	title.add_theme_font_size_override("font_size", 28)
	vbox.add_child(title)
	
	# Player count selector
	var count_label = Label.new()
	count_label.text = "Number of Players:"
	vbox.add_child(count_label)
	
	var count_slider = HSlider.new()
	count_slider.min_value = 4
	count_slider.max_value = 12
	count_slider.value = 4
	count_slider.value_changed.connect(_on_player_count_changed)
	vbox.add_child(count_slider)
	
	# Player name inputs
	var players_container = VBoxContainer.new()
	for i in range(4):
		var hbox = HBoxContainer.new()
		var label = Label.new()
		label.text = "Player %d:" % (i + 1)
		var input = LineEdit.new()
		input.placeholder_text = "Enter name"
		input.custom_minimum_size = Vector2(200, 0)
		hbox.add_child(label)
		hbox.add_child(input)
		players_container.add_child(hbox)
		player_slots.append(input)
	
	vbox.add_child(players_container)
	
	# Start button
	var start_btn = Button.new()
	start_btn.text = "START GAME"
	start_btn.pressed.connect(_on_start_game)
	vbox.add_child(start_btn)

func _on_player_count_changed(value: int):
	num_players = int(value)

func _on_start_game():
	var names = []
	for i in range(num_players):
		if i < player_slots.size():
			var name = player_slots[i].text.strip_edges()
			if name.is_empty():
				name = "Player %d" % (i + 1)
			names.append(name)
	
	game_manager.initialize_game(names, num_players)
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

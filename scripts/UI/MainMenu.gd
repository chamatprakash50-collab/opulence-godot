# MainMenu.gd - Main menu controller
extends Control

var game_manager

func _ready():
	game_manager = get_tree().root.get_node("GameManager")
	setup_buttons()

func setup_buttons():
	if has_node("VBoxContainer/PlayButton"):
		$VBoxContainer/PlayButton.pressed.connect(_on_play_pressed)
	if has_node("VBoxContainer/SettingsButton"):
		$VBoxContainer/SettingsButton.pressed.connect(_on_settings_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/Lobby.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/Settings.tscn")

# GameManager.gd - Main game controller
extends Node

var players = []
var current_player = 0
var phase = "idle"  # idle, rolling, moving, buying, end
var game_state = {}
var last_roll = [1, 1]
var board_node
var ui_node
var settings = {}
var game_log = []

func _ready():
	load_settings()
	add_to_group("game_manager")

func initialize_game(player_names: Array, num_players: int):
	players.clear()
	game_log.clear()
	current_player = 0
	phase = "idle"
	
	var characters = Constants.CHARACTERS.duplicate()
	characters.shuffle()
	
	for i in range(num_players):
		var player = {
			"id": i,
			"name": player_names[i] if i < player_names.size() else "Player " + str(i + 1),
			"character": characters[i % characters.size()],
			"money": 1500000,
			"position": 0,
			"properties": [],
			"mortgaged": [],
			"in_jail": false,
			"jail_turns": 0,
			"tokens": 2,
			"bankrupt": false,
			"houses": {},
			"token_placed": {},
			"bonus_salary": 0,
			"rounds": 0,
		}
		players.append(player)
	
	add_log("Game initialized with %d players" % num_players)

func roll_dice() -> Array:
	var die1 = randi() % 6 + 1
	var die2 = randi() % 6 + 1
	last_roll = [die1, die2]
	return last_roll

func move_player(player_id: int, steps: int):
	var player = players[player_id]
	var old_pos = player["position"]
	var new_pos = (old_pos + steps) % 40
	
	var passed_start = (new_pos < old_pos) or (old_pos == 0 and steps > 0)
	if passed_start and not player["in_jail"]:
		add_salary(player)
	
	player["position"] = new_pos
	add_log("%s moved to tile %d" % [player["name"], new_pos])

func add_salary(player: Dictionary):
	var salary = 200000
	for prop_id in player["properties"]:
		if prop_id in Constants.BONUS_TILES and prop_id not in player["mortgaged"]:
			salary += 50000
	
	player["bonus_salary"] = salary - 200000
	player["money"] += salary
	player["rounds"] += 1
	add_log("%s passed START and collected ₹%s" % [player["name"], Constants.format_money(salary)])

func buy_property(player_id: int, tile_id: int) -> bool:
	var player = players[player_id]
	var tile = Constants.get_tile(tile_id)
	
	if player["money"] < tile["cost"]:
		return false
	
	player["money"] -= tile["cost"]
	player["properties"].append(tile_id)
	add_log("%s bought %s for ₹%s" % [player["name"], tile["name"], Constants.format_money(tile["cost"])])
	return true

func calculate_rent(owner_id: int, tile_id: int) -> int:
	var owner = players[owner_id]
	var tile = Constants.get_tile(tile_id)
	
	if tile["type"] == "rail":
		var owned_rails = 0
		for prop in owner["properties"]:
			if Constants.get_tile(prop)["type"] == "rail" and prop not in owner["mortgaged"]:
				owned_rails += 1
		return tile["rent"][min(owned_rails - 1, 3)] if owned_rails > 0 else 0
	
	if tile["type"] == "bonus":
		return 0
	
	var base_rent = tile["rent"][0] if tile["rent"].size() > 0 else 0
	var houses = owner["houses"].get(tile_id, 0)
	
	if houses > 0:
		base_rent = tile["rent"][min(houses, 4)]
	else:
		# Check for monopoly
		var group_tiles = []
		for t in Constants.TILES:
			if t["group"] == tile["group"]:
				group_tiles.append(t["id"])
		
		var has_monopoly = true
		for gt in group_tiles:
			if gt not in owner["properties"] or gt in owner["mortgaged"]:
				has_monopoly = false
				break
		
		if has_monopoly:
			base_rent *= 2
	
	if owner["token_placed"].get(tile_id, false):
		base_rent += 50000
	
	return base_rent

func pay_rent(payer_id: int, owner_id: int, tile_id: int) -> int:
	var payer = players[payer_id]
	var owner = players[owner_id]
	var tile = Constants.get_tile(tile_id)
	var amount = calculate_rent(owner_id, tile_id)
	
	if payer["money"] < amount:
		amount = payer["money"]
	
	payer["money"] -= amount
	owner["money"] += amount
	add_log("%s paid ₹%s rent to %s for %s" % [payer["name"], Constants.format_money(amount), owner["name"], tile["name"]])
	return amount

func declare_bankruptcy(player_id: int):
	var player = players[player_id]
	player["bankrupt"] = true
	player["money"] = 0
	player["properties"] = []
	player["mortgaged"] = []
	add_log("%s is BANKRUPT!" % player["name"])

func add_log(message: String):
	game_log.append(message)
	if game_log.size() > 100:
		game_log.pop_front()

func load_settings():
	var config = ConfigFile.new()
	var err = config.load("user://opulence_settings.ini")
	if err == OK:
		settings = config.get_section_keys("settings")

func save_settings():
	var config = ConfigFile.new()
	for key in settings:
		config.set_value("settings", key, settings[key])
	config.save("user://opulence_settings.ini")

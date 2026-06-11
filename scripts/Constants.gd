# Constants.gd - All game data (characters, tiles, colors)
extends Node

const CHARACTERS = [
	{"name": "IAS Officer", "color": "#D4AF37", "token": "👨‍💼", "desc": "The Indian Administrative Service officer"},
	{"name": "Software Engr", "color": "#E74C3C", "token": "💻", "desc": "Tech professional from Bengaluru"},
	{"name": "Doctor", "color": "#3498DB", "token": "🩺", "desc": "Dedicated physician"},
	{"name": "CA", "color": "#27AE60", "token": "📊", "desc": "Chartered Accountant"},
	{"name": "Entrepreneur", "color": "#9B59B6", "token": "🤝", "desc": "Self-made business owner"},
	{"name": "Farmer", "color": "#E67E22", "token": "🌾", "desc": "Progressive farmer"},
	{"name": "Lawyer", "color": "#1ABC9C", "token": "⚖", "desc": "Sharp criminal defense lawyer"},
	{"name": "Teacher", "color": "#E91E63", "token": "📚", "desc": "Respected professor"},
	{"name": "Journalist", "color": "#FF9800", "token": "🎙", "desc": "Field reporter"},
	{"name": "Bank Manager", "color": "#795548", "token": "🏦", "desc": "Senior bank manager"},
	{"name": "Policeman", "color": "#00BCD4", "token": "👮", "desc": "Inspector on patrol"},
	{"name": "Politician", "color": "#607D8B", "token": "🗳", "desc": "Elected leader"},
]

const GROUP_COLORS = {
	"brown": "#9B4010",
	"lblue": "#3A7A9B",
	"pink": "#B83878",
	"orange": "#B86010",
	"red": "#981828",
	"yellow": "#A88000",
	"green": "#0A4818",
	"dblue": "#0A0A78",
	"util": "#505050",
	"rail": "#303030",
}

const TILES = [
	{"id": 0, "pos": 0, "name": "START", "type": "start", "icon": "🏁", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 1, "pos": 1, "name": "AGRA", "type": "prop", "icon": "🕌", "group": "brown", "cost": 175000, "mort": 87500, "rent": [18000, 36000, 72000, 144000, 288000]},
	{"id": 2, "pos": 2, "name": "INDORE", "type": "prop", "icon": "🏛", "group": "brown", "cost": 200000, "mort": 100000, "rent": [20000, 40000, 80000, 160000, 320000]},
	{"id": 3, "pos": 3, "name": "VORTEX MALL", "type": "bonus", "icon": "🛍", "group": "util", "cost": 1000000, "mort": 500000, "rent": []},
	{"id": 4, "pos": 4, "name": "PRAYAGRAJ", "type": "prop", "icon": "🌊", "group": "lblue", "cost": 250000, "mort": 125000, "rent": [28000, 56000, 112000, 224000, 448000]},
	{"id": 5, "pos": 5, "name": "BHOPAL", "type": "prop", "icon": "🌿", "group": "lblue", "cost": 250000, "mort": 125000, "rent": [28000, 56000, 112000, 224000, 448000]},
	{"id": 6, "pos": 6, "name": "COMMUNITY CHEST", "type": "chest", "icon": "📦", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 7, "pos": 7, "name": "KANPUR", "type": "prop", "icon": "🏗", "group": "lblue", "cost": 280000, "mort": 140000, "rent": [30000, 60000, 120000, 240000, 480000]},
	{"id": 8, "pos": 8, "name": "AMRITSAR", "type": "prop", "icon": "⛩", "group": "pink", "cost": 320000, "mort": 160000, "rent": [38000, 76000, 152000, 304000, 608000]},
	{"id": 9, "pos": 9, "name": "CHANDIGARH", "type": "prop", "icon": "🏙", "group": "pink", "cost": 350000, "mort": 175000, "rent": [40000, 80000, 160000, 320000, 640000]},
	{"id": 10, "pos": 10, "name": "JAIL", "type": "jail", "icon": "🔒", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 11, "pos": 11, "name": "SURAT", "type": "prop", "icon": "💎", "group": "pink", "cost": 380000, "mort": 190000, "rent": [44000, 88000, 176000, 352000, 704000]},
	{"id": 12, "pos": 12, "name": "PRAVAHAN BUSES", "type": "bonus", "icon": "🚌", "group": "util", "cost": 1100000, "mort": 550000, "rent": []},
	{"id": 13, "pos": 13, "name": "JAIPUR", "type": "prop", "icon": "🏯", "group": "orange", "cost": 450000, "mort": 225000, "rent": [48000, 96000, 192000, 384000, 768000]},
	{"id": 14, "pos": 14, "name": "RISHIKESH", "type": "prop", "icon": "🙏", "group": "orange", "cost": 480000, "mort": 240000, "rent": [52000, 104000, 208000, 416000, 832000]},
	{"id": 15, "pos": 15, "name": "CHANCE", "type": "chance", "icon": "❓", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 16, "pos": 16, "name": "PURI", "type": "prop", "icon": "🐚", "group": "orange", "cost": 520000, "mort": 260000, "rent": [56000, 112000, 224000, 448000, 896000]},
	{"id": 17, "pos": 17, "name": "KEDARNATH", "type": "prop", "icon": "🗻", "group": "red", "cost": 580000, "mort": 290000, "rent": [58000, 116000, 232000, 464000, 928000]},
	{"id": 18, "pos": 18, "name": "MUMBAI/VIZAG", "type": "prop", "icon": "⚓", "group": "red", "cost": 620000, "mort": 310000, "rent": [62000, 124000, 248000, 496000, 992000]},
	{"id": 19, "pos": 19, "name": "CLUB LOUNGE", "type": "free", "icon": "🛋", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 20, "pos": 20, "name": "UJJAIN", "type": "prop", "icon": "🔱", "group": "red", "cost": 650000, "mort": 325000, "rent": [66000, 132000, 264000, 528000, 1056000]},
	{"id": 21, "pos": 21, "name": "NOIDA", "type": "prop", "icon": "🏢", "group": "yellow", "cost": 700000, "mort": 350000, "rent": [68000, 136000, 272000, 544000, 1088000]},
	{"id": 22, "pos": 22, "name": "LUXOR LOOMS", "type": "bonus", "icon": "🏪", "group": "util", "cost": 1500000, "mort": 750000, "rent": []},
	{"id": 23, "pos": 23, "name": "SHIMLA", "type": "prop", "icon": "🏔", "group": "yellow", "cost": 740000, "mort": 370000, "rent": [72000, 144000, 288000, 576000, 1152000]},
	{"id": 24, "pos": 24, "name": "SRINAGAR", "type": "prop", "icon": "🌷", "group": "yellow", "cost": 780000, "mort": 390000, "rent": [76000, 152000, 304000, 608000, 1216000]},
	{"id": 25, "pos": 25, "name": "VARANASI", "type": "prop", "icon": "🎵", "group": "green", "cost": 820000, "mort": 410000, "rent": [78000, 156000, 312000, 624000, 1248000]},
	{"id": 26, "pos": 26, "name": "VARANASI GHATS", "type": "prop", "icon": "🪔", "group": "green", "cost": 860000, "mort": 430000, "rent": [82000, 164000, 328000, 656000, 1312000]},
	{"id": 27, "pos": 27, "name": "COMMUNITY CHEST", "type": "chest", "icon": "📦", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 28, "pos": 28, "name": "HYDERABAD", "type": "prop", "icon": "💠", "group": "green", "cost": 900000, "mort": 450000, "rent": [86000, 172000, 344000, 688000, 1376000]},
	{"id": 29, "pos": 29, "name": "DARJEELING", "type": "prop", "icon": "🍵", "group": "dblue", "cost": 950000, "mort": 475000, "rent": [92000, 184000, 368000, 736000, 1472000]},
	{"id": 30, "pos": 30, "name": "REST ZONE", "type": "free", "icon": "🌴", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 31, "pos": 31, "name": "GOA", "type": "prop", "icon": "🏖", "group": "dblue", "cost": 1000000, "mort": 500000, "rent": [98000, 196000, 392000, 784000, 1568000]},
	{"id": 32, "pos": 32, "name": "KOLKATA", "type": "prop", "icon": "🌉", "group": "dblue", "cost": 1050000, "mort": 525000, "rent": [104000, 208000, 416000, 832000, 1664000]},
	{"id": 33, "pos": 33, "name": "INDUS FUELS", "type": "bonus", "icon": "⛽", "group": "util", "cost": 2000000, "mort": 1000000, "rent": []},
	{"id": 34, "pos": 34, "name": "CHENNAI", "type": "prop", "icon": "🌅", "group": "dblue", "cost": 1100000, "mort": 550000, "rent": [110000, 220000, 440000, 880000, 1760000]},
	{"id": 35, "pos": 35, "name": "BENGALURU", "type": "prop", "icon": "🌿", "group": "dblue", "cost": 1150000, "mort": 575000, "rent": [116000, 232000, 464000, 928000, 1856000]},
	{"id": 36, "pos": 36, "name": "CHANCE", "type": "chance", "icon": "❓", "group": null, "cost": 0, "mort": 0, "rent": []},
	{"id": 37, "pos": 37, "name": "DELHI", "type": "prop", "icon": "🏛", "group": "dblue", "cost": 1200000, "mort": 600000, "rent": [120000, 240000, 480000, 960000, 1920000]},
	{"id": 38, "pos": 38, "name": "M.B INFRA", "type": "bonus", "icon": "🏗", "group": "util", "cost": 1800000, "mort": 900000, "rent": []},
	{"id": 39, "pos": 39, "name": "RAILWAY", "type": "rail", "icon": "🚂", "group": "rail", "cost": 2500000, "mort": 1250000, "rent": [50000, 100000, 200000, 400000]},
]

const CHEST_GOOD = [
	{"msg": "Government relief fund grant!", "amt_min": 8000, "amt_max": 20000},
	{"msg": "Business expansion successful!", "amt_min": 10000, "amt_max": 25000},
	{"msg": "Dividend from your investments!", "amt_min": 6000, "amt_max": 15000},
]

const CHEST_BAD = [
	{"msg": "Tax audit penalty!", "amt_min": 5000, "amt_max": 15000},
	{"msg": "Water pipe burst – repairs!", "amt_min": 4000, "amt_max": 12000},
	{"msg": "Court case legal fees!", "amt_min": 6000, "amt_max": 18000},
]

const CHANCE_GOOD = [
	"Business deal closed successfully!",
	"Royal dividend paid out!",
	"Lucky investment pays off!",
	"Bank error in your favour!",
]

const CHANCE_BAD = [
	"Doctor's fee – emergency visit!",
	"School fees for your children!",
	"Income tax assessment!",
	"Penalty for speeding!",
]

const BONUS_TILES = [3, 12, 22, 33, 38]  # IDs of bonus properties

func get_tile(id: int) -> Dictionary:
	return TILES[id] if id < TILES.size() else {}

func format_money(amount: int) -> String:
	if amount >= 10000000:
		return "%.1fCr" % (amount / 10000000.0)
	elif amount >= 100000:
		return "%.1fL" % (amount / 100000.0)
	elif amount >= 1000:
		return "%.0fK" % (amount / 1000.0)
	return str(amount)

extends Control

@onready var CARD = preload("res://game/UI/menus/upgrade_menu/card.tscn")
@export var parent_node = self

var stabbey_copies = 0
var grove_copies = 0
var lodey_copies = 0
var mami_copies = 0
var kanon_copies = 0
var hacke_copies = 0
var dune_copies = 0
var riff_copies = 0
var nyao_copies = 0
var oora_copies = 0
var bawl_copies = 0

var iteration = 0

enum CARD_TYPES {GEMS, ITEMS, DOLLS}

@export_enum( "GEMS", "DOLLS", "ITEMS") var constructType

var randomized_cardType_index:int = CARD_TYPES.values()[ randi()%CARD_TYPES.size() ]

var card_data = {
	"GEMS": {
		"RED": {
			"title": "Red Style Gem",
			"description": "You see memories of destruction and despair",
			"portrait": "res://Assets/Debug_Assets/red_gem.png",
			"borderColor": Color.from_hsv(7.0/359.0, 96.0/100.0, 80.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(35.0/359.0, 23.0/100.0, 100.0/100.0, 255.0/255.0)
		},
		"BLUE": {
			"title": "Blue Style Gem",
			"description": "You see memories of an endless storm",
			"portrait": "res://Assets/Debug_Assets/blue_gem.png",
			"borderColor": Color.from_hsv(199.0/359.0, 90.0/100.0, 100.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(187.0/359.0, 29.0/100.0, 95.0/100.0, 255.0/225.0)
		},
		"YELLOW": {
			"title": "Yellow Style Gem",
			"description": "You see memories of a raging swarm",
			"portrait": "res://Assets/Debug_Assets/yellow_gem.png",
			"borderColor": Color.from_hsv(35.0/359.0, 94.0/100.0, 100.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(40.0/359.0, 22.0/100.0, 100.0/100.0, 255.0/255.0)
		}
	},
	"DOLLS": {
		"LODEY": {
			"title": "Lodey",
			"description": [
				"Uses long-range simple projectiles shot away from the player.",
				"Projectiles deal 5 more base damage",
				"Shoots more frequently",
				"Projectiles deal 5 more base damage",
				"Shoots an additional projectile",
				],
			"portrait": "res://Assets/Debug_Assets/PointerFire.png",
			"borderColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0)
		},
		"STABBEY": {
			"title": "Stabbey",
			"description": [
				"Weilds a blade and spins around.",
				"Blade deals 5 more base damage",
				"Gains an extra blade",
				"Blade deals 5 more base damage",
				"Gains an extra blade, and swings faster",
				],
			"portrait": "res://Assets/Debug_Assets/stabbey_sketch.png",
			"borderColor": Color.from_hsv(64.0/359.0, 53.0/100.0, 100.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(57.0/359.0, 25.0/100.0, 83.0/100.0, 225.0/225.0)
		},
		"MAMI": {
			"title": "Mami",
			"description": [
				"Cooks in waves called meals, throwing her food up into the air.",
				"Projectiles deal 5 more base damage",
				"Cooks more food per meal",
				"Projectiles deal 5 more base damage",
				"Food bounces once on the floor"
				],
			"portrait": "res://Assets/Debug_Assets/mami_sketch.png",
			"borderColor": Color.from_hsv(43.0/359, 39.0/100.0, 100.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(181.0/359, 22.0/100.0, 95.0/100.0, 255.0/255.0)
		},
		"KANON": {
			"title": "Kanon",
			"description": [
				"Sits in a specialized tank, shooting in a cross and X pattern cyclically.",
				"Projectiles deal 5 more base damage",
				"Shoots more frequently",
				"Projectiles deal 5 more base damage",
				"Shoots out of all 8 cannons consecutively"
				],
			"portrait": "res://Assets/Debug_Assets/kanon_sketch.png",
			"borderColor": Color.from_hsv(0.0/359.0, 0.0/100.0, 61.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(19.0/359.0, 63.0/100.0, 80.0/100.0, 255.0/255.0)
		},
		"HACKE": {
			"title": "Hacke",
			"description": [
				"Draws selection squares that can hit groups of enemies.",
				"Selection areas deals 5 more base damage",
				"Selection areas get larger",
				"Selection areas deals 5 more base damage",
				"Selection areas get larger and activate twice"
				],
			"portrait": "res://Assets/Debug_Assets/hacke_sketch.png",
			"borderColor": Color.from_hsv(227.0/359.0, 80.0/100.0, 16.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(70.0/359.0, 74.0/100.0, 100.0/100.0, 255.0/255.0)
		},
		"DUNE": {
			"title": "Dune",
			"description": [
				"Shoots sandstorms in random directions.",
				"Projectiles deal 5 more base damage",
				"Shoots an additional projectile",
				"Projectiles deal 5 more base damage",
				"Shoots an additional projectile and sandstorms split of into 3 smaller storms",
				],
			"portrait": "res://Assets/Debug_Assets/dune_sketch.png",
			"borderColor": Color.from_hsv(40.0/359.0, 100.0/100.0, 60.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(216.0/359.0, 46.0/100.0, 87.0/100.0, 255.0/255.0)
		},
		"RIFF": {
			"title": "Riff",
			"description": [
				"Her music is electric.",
				"Projectiles deal 5 more base damage",
				"lightning can chain onto 5 more enemies",
				"Lightning stuns enemies for .05 seconds",
				"Lightning can chain onto 5 more enemies and stuns them for .05 seconds longer",
				],
			"portrait": "res://Assets/Debug_Assets/riff_sketch.png",
			"borderColor": Color.from_hsv(300.0/359.0, 82.0/100.0, 100.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(187.0/359.0, 29.0/100.0, 95.0/100.0, 255.0/255.0)
		},
		"NYAO": {
			"title": "Nyao",
			"description": [
				"Uses a lazer to decimate enemies.",
				"Lazer deals 5 more base damage",
				"Shoots more frequently",
				"Lazer deals 5 more base damage",
				"Shoots even more frequently" 
				],
			"portrait": "res://Assets/Debug_Assets/nyao_sketch.png",
			"borderColor": Color.from_hsv(40.0/359.0, 11.0/100.0, 100.0/100.0, 225.0/225.0),
			"textColor": Color.from_hsv(4.0/359.0, 98.0/100.0, 98.0/100.0, 225.0/225.0)
		},
		"OORA": {
			"title": "Oora",
			"description": [
				"Lazes around most the time keeping you safe in a small circle.",
				"Area deals 5 more base damage",
				"Area gets larger",
				"Area deals 5 more base damage",
				"Area gets even larger and knocks back enemies slightly",
				],
			"portrait": "res://Assets/Debug_Assets/PointerFire.png",
			"borderColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0)
		},
		"BAWL": {
			"title": "Bawl",
			"description": [
				"Curls in a ball and protects you from incoming attacks.",
				"Spins faster",
				"Obtain an additional Bawl",
				"Spins even faster",
				"Obtain an additional Bawl and spins even faster"
				],
			"portrait": "res://Assets/Debug_Assets/PointerFire.png",
			"borderColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0)
		},
		"GROVE": {
			"title": "Grove",
			"description": [
				"Does not attack, instead grows to produce valuables",
				"Grows faster",
				"Harvests yeild more",
				"Grows even faster",
				"Grows even faster and harvests yeild more when Grove touches enemies",
				],
			"portrait": "res://Assets/Debug_Assets/PointerFire.png",
			"borderColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0),
			"textColor": Color.from_hsv(00.0/359.0, 00.0/100.0, 00.0/100.0, 255.0/255.0)
		},
	}
}

func generate_card():
	var type = CARD_TYPES.DOLLS
	var card_name
	
	
	#KEEP TRACK OF CARDS GENERATED ON A STACK [card1, card2, card3]
	#KEEP TRACK OF ACTIVE DOLLS - MESSAGE BUS
	#KEEP TRACK OF ITEMS - MESSAGE BUS
	#IF STACK.count == 0 THEN DO 50/50 new gem/doll or upgrade doll
	#IF STACK.count == 1 THEN DO 33/33/33 new doll, upgrade doll, new item
	#IF STACK.count == 2 25/75 new item, upgrade item 
	
	#DO THE WEIGHTED MATH WITH DUMMY DATA
	#DATA VALIDATION - MESSAGE BUS
	#UPDATE CARD NAME
	#UPDATE TYPE
	#SEND THAT SHIT
	
	if iteration == 0:
		pass
	
	if type == CARD_TYPES.GEMS:
		var card_result = card_data['GEMS']['RED']
		card_constructor(
			card_result.title, 
			card_result.description,
			card_result.borderColor,
			card_result.textColor,
			card_result.portrait,
			CARD_TYPES.GEMS
		)
		pass
	
	if type == CARD_TYPES.DOLLS:
		var card_result = card_data["DOLLS"]["NYAO"]
		card_constructor(
			card_result.title, 
			card_result.description[0],
			card_result.borderColor,
			card_result.textColor,
			card_result.portrait,
			CARD_TYPES.GEMS
		)
		pass
	if type == CARD_TYPES.ITEMS:
		var card_result = card_data["ITEMS"]["SCISSORS"]
		card_constructor(
			card_result.title, 
			card_result.description[0],
			card_result.borderColor,
			card_result.textColor,
			card_result.portrait,
			CARD_TYPES.ITEMS
			)

func card_constructor(title, description, border_color, text_color, portrait, type):
	var new_card = CARD.instantiate()
	self.add_child(new_card)
	new_card.title = title
	new_card.description = description
	new_card.border_color = border_color
	new_card.text_color = text_color
	new_card.portrait = portrait
	new_card.type = type
	#new_card.yell()
	new_card.update()
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(randomized_cardType_index)
	#card_constructor('test', 'test', CARD_TYPES.GEM)
	iteration = 0
	for i in 3:
		generate_card()
		iteration += 1
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

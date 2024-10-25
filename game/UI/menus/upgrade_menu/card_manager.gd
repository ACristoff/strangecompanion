extends Control

@onready var CARD = preload("res://game/UI/menus/card.tscn")
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

enum CARD_TYPES {GEMS, ITEMS, DOLLS}

var card_data = {
	"GEMS": {
		"RED": {
			"title": "Red Style Gem",
			"description": "You see memories of destruction and despair",
			"portrait": "res://Assets/Debug_Assets/red_gem.png",
			"borderColor": Color.from_hsv(7.0/255, 96.0/100, 80.0/100, 255/255),
			"textColor": Color.from_hsv(35.0/255, 23.0/100, 100.0/100, 255/255)
		},
		"BLUE": {},
		"YELLOW": {}
	},
	"DOLLS": {
		"LODEY": {
			"title": "Red Style Gem",
			"description": [
				"Uses long-range simple projectiles shot away from the player.",
				"Projectiles deal 5 more base damage"
				],
			"portrait": "res://Assets/Debug_Assets/red_gem.png",
			"borderColor": Color.from_hsv(7.0/255, 96.0/100, 80.0/100, 255/255),
			"textColor": Color.from_hsv(35.0/255, 23.0/100, 100.0/100, 255/255)
		}
	}
}

		#"Lodey": {
			#"Names": {
				#"Title": "Lodey",
				#"Title2": "Lodey UPGRADE",
			#},
			#"Descriptions": {
				#"copy1" : "Uses long-range simple projectiles shot away from the player.",
				#"copy2" : "Projectiles deal 5 more base damage",
				#"copy3" : "Shoots more frequently",
				#"copy4" : "Projectiles deal 5 more base damage",
				#"copy5" : "Shoots an additional projectile",
				#},
			#"Portrait" : lodey,
			#"BorderColor" : nullborder,
			#"BGColor" : nulltext,
		#},

		#"Blue": {
			#"Names": {
				#"Title": "Blue Style Gem",
			#},
			#"Description": "You see memories of a relentless storm",
			#"Portrait" : blue,
			#"BorderColor" : blueborder,
			#"BGColor" : bluetext,
		#},
		#"Yellow": {
			#"Names": {
				#"Title": "Yellow Style Gem",
			#},
			#"Description": "You see memories of a calm river in summer",
			#"Portrait" : yellow,
			#"BorderColor" : yellowborder,
			#"BGColor" : yellowtext,
		#},
	#},

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
		var card_result = card_data["DOLLS"]["LODEY"]
		card_constructor(
			card_result.title, 
			card_result.description[0],
			card_result.borderColor,
			card_result.textColor,
			card_result.portrait,
			CARD_TYPES.GEMS
		)
		pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#card_constructor('test', 'test', CARD_TYPES.GEM)
	generate_card()
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

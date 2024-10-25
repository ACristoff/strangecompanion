extends TextureButton
#----------------------------------
#DOLLS
@onready var lodey = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var stabbey = preload("res://Assets/Debug_Assets/stabbey_sketch.png")
@onready var mami = preload("res://Assets/Debug_Assets/mami_sketch.png")
@onready var kanon = preload("res://Assets/Debug_Assets/kanon_sketch.png")
@onready var hacke = preload("res://Assets/Debug_Assets/hacke_sketch.png")
@onready var dune = preload("res://Assets/Debug_Assets/dune_sketch.png")
@onready var riff = preload("res://Assets/Debug_Assets/riff_sketch.png")
@onready var oora = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var bawl = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var grove = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var nyao = preload("res://Assets/Debug_Assets/nyao_sketch.png")
#----------------------------------
#GEMS
@onready var red = preload("res://Assets/Debug_Assets/red_gem.png")
@onready var blue = preload("res://Assets/Debug_Assets/blue_gem.png")
@onready var yellow = preload("res://Assets/Debug_Assets/yellow_gem.png")
#----------------------------------
#ITEMS


##REFERENCES
@onready var title_label = $Control/FrontBorder/Title
@onready var description_label = $Control/FrontBorder/Description
@onready var border = $Control/FrontBorder
@onready var portrait_texture = $Control/FrontBorder/ColorRect/Portrait

#determines which card type it is on spawn (i.e. is it an item card?
# or is it a doll card?

#var type = 0

#var stabbey_copies = 0
#var grove_copies = 0
#var lodey_copies = 0
#var mami_copies = 0
#var kanon_copies = 0
#var hacke_copies = 0
#var dune_copies = 0
#var riff_copies = 0
#var nyao_copies = 0
#var oora_copies = 0
#var bawl_copies = 0

signal card_selected#(type, name, copy)

#----------------------------------
#ITEM COLORS

#----------------------------------
#BLUEGEM COLORS
var blueborder = Color.from_hsv(199.0, 90.0, 100.0, 1)
var bluetext = Color.from_hsv(187.0, 29.0, 95.0, 1)
#REDGEM COLORS
var redborder = Color.from_hsv(7.0, 96.0, 80.0, 1)
var redtext = Color.from_hsv(350.0, 23.0, 100.0, 1)
#YELLOW GEM COLORS
var yellowborder = Color.from_hsv(35.0, 94.0, 100.0, 1)
var yellowtext = Color.from_hsv(40.0, 22.0, 100.0, 1)
#----------------------------------
#DOLL COLORS
#STABBEY COLORS
var stabbeyborder = Color.from_hsv(64.0, 53.0, 100.0, 1)
var stabbeytext = Color.from_hsv(57.0, 25.0, 83.0, 1)
#DUNE COLORS
var duneborder = Color.from_hsv(40.0, 100.0, 60.0, 1)
var dunetext = Color.from_hsv(216.0, 46.0, 87.0, 1)
#MAMI COLORS
var mamiborder = Color.from_hsv(43.0, 39.0, 100.0, 1)
var mamitext = Color.from_hsv(181.0, 22.0, 95.0, 1)
#KANON COLORS
var kanonborder = Color.from_hsv(0.0, 0.0, 61.0, 1)
var kanontext = Color.from_hsv(19.0, 63.0, 80.0, 1)
#LODEY COLORS

#HACKE COLORS
var hackeborder = Color.from_hsv(227.0, 80.0, 16.0, 1)
var hacketext = Color.from_hsv(70.0, 74.0, 100.0, 1)
#OORA COLORS

#NYAO COLORS
var nyaoborder = Color.from_hsv(40.0, 11.0, 100.0, 1)
var nyaotext = Color.from_hsv(4.0, 98.0, 98.0, 1)
#RIFF COLORS
var riffborder = Color.from_hsv(300.0, 82.0, 100.0, 1)
var rifftext = Color.from_hsv(187.0, 29.0, 95.0, 1)
#BAWL COLORS

#GROVE COLORS

#MISSING ASSETS
#----------------------------------
var nullborder = Color.from_hsv(0.0, 0.0, 0.0, 1)
var nulltext = Color.from_hsv(0.0, 0.0, 30.0, 1)

@export var title := 'TITLE'
@export var description := 'DESCRIPTION'
@export var type = ''
@export var text_color: Color
@export var border_color: Color
@export var portrait = ''

func yell():
	print('test')
	prints(title, description, type, text_color, border_color, portrait)
	pass

func update():
	title_label.text = title
	description_label.text = description
	portrait_texture.texture = load(portrait)
	border.self_modulate = border_color
	title_label.self_modulate = text_color
	description_label.self_modulate = text_color
	pass

var card_types =  {
	"Gems": {
		"Red": {
			"Names": {
				"Title": "Red Style Gem",
			},
			"Description": "You see memories of destruction and despair" ,
			"Portrait" : red,
			"BorderColor" : redborder,
			"BGColor" : redtext,
		},
		"Blue": {
			"Names": {
				"Title": "Blue Style Gem",
			},
			"Description": "You see memories of a relentless storm",
			"Portrait" : blue,
			"BorderColor" : blueborder,
			"BGColor" : bluetext,
		},
		"Yellow": {
			"Names": {
				"Title": "Yellow Style Gem",
			},
			"Description": "You see memories of a calm river in summer",
			"Portrait" : yellow,
			"BorderColor" : yellowborder,
			"BGColor" : yellowtext,
		},
	},
	"Dolls": {
		"Stabbey": {
			"Names": {
				"Title": "Stabbey",
				"Title2": "Stabbey UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Weilds a blade and spins around.",
				"copy2": "Blade deals 5 more base damage",
				"copy3": "Gains an extra blade",
				"copy4": "Blade deals 5 more base damage",
				"copy5": "Gains an extra blade, and swings faster",
				},
			"Portrait" : stabbey,
			"BorderColor" : stabbeyborder,
			"BGColor" : stabbeytext,
		},
		"Lodey": {
			"Names": {
				"Title": "Lodey",
				"Title2": "Lodey UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Uses long-range simple projectiles shot away from the player.",
				"copy2" : "Projectiles deal 5 more base damage",
				"copy3" : "Shoots more frequently",
				"copy4" : "Projectiles deal 5 more base damage",
				"copy5" : "Shoots an additional projectile",
				},
			"Portrait" : lodey,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Mami": {
			"Names": {
				"Title": "Mami",
				"Title2": "Mami UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Cooks in waves called meals, throwing her food up into the air.",
				"copy2" : "Projectiles deal 5 more base damage",
				"copy3" : "Cooks more food per meal",
				"copy4" : "Projectiles deal 5 more base damage",
				"copy5" : "Food bounces once on the floor"
				},
			"Portrait" : mami,
			"BorderColor" : mamiborder,
			"BGColor" : mamitext,
		},
		"Kanon": {
			"Names": {
				"Title": "Kanon",
				"Title2": "Kanon UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Sits in a specialized tank, shooting in a cross and X pattern cyclically.",
				"copy2" : "Projectiles deal 5 more base damage",
				"copy3" : "Shoots more frequently",
				"copy4" : "Projectiles deal 5 more base damage",
				"copy5" : "Shoots out of all 8 cannons consecutively"
				},
			"Portrait" : kanon,
			"BorderColor" : kanonborder,
			"BGColor" : kanontext,
		},
		"Hacke": {
			"Names": {
				"Title": "Hacke",
				"Title2": "Hacke UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Draws selection squares that can hit groups of enemies.",
				"copy2" : "Selection areas deals 5 more base damage",
				"copy3" : "Selection areas get larger",
				"copy4" : "Selection areas deals 5 more base damage",
				"copy5" : "Selection areas get larger and activate twice"
				},
			"Portrait" : hacke,
			"BorderColor" : hackeborder,
			"BGColor" : hacketext,
		},
		"Oora": {
			"Names": {
				"Title": "Oora",
				"Title2": "Oora UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Lazes around most the time keeping you safe in a small circle.",
				"copy2" : "Area deals 5 more base damage",
				"copy3" : "Area gets larger",
				"copy4" : "Area deals 5 more base damage",
				"copy5" : "Area gets even larger and knocks back enemies slightly",
				},
			"Portrait" : oora,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Dune": {
			"Names": {
				"Title": "Dune",
				"Title2": "Dune UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Shoots sandstorms in random directions.",
				"copy2" : "Projectiles deal 5 more base damage",
				"copy3" : "Shoots an additional projectile",
				"copy4" : "Projectiles deal 5 more base damage",
				"copy5" : "Shoots an additional projectile and sandstorms split of into 3 smaller storms",
				},
			"Portrait" : dune,
			"BorderColor" : duneborder,
			"BGColor" : dunetext,
		},
		"Bawl": {
			"Names": {
				"Title": "Bawl",
				"Title2": "Bawl UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Curls in a ball and protects you from incoming attacks.",
				"copy2" : "Spins faster",
				"copy3" : "Obtain an additional Bawl",
				"copy4" : "Spins even faster",
				"copy5" : "Obtain an additional Bawl and spins even faster"
				
				},
			"Portrait" : bawl,
			"BorderColor" : nullborder,
			"BGColor" :  nulltext,
		},
		"Riff": {
			"Names": {
				"Title": "Riff",
				"Title2": "Riff UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Her music is electric.",
				"copy2" : "Projectiles deal 5 more base damage",
				"copy3" : "lightning can chain onto 5 more enemies",
				"copy4" : "Lightning stuns enemies for .05 seconds",
				"copy5" : "Lightning can chain onto 5 more enemies and stuns them for .05 seconds longer",
				},
			"Portrait" : riff,
			"BorderColor" : riffborder,
			"BGColor" : rifftext,
		},
		"Nyao": {
			"Names": {
				"Title": "Nyao",
				"Title2": "Nyao UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Uses a lazer to decimate enemies.",
				"copy2" : "Lazer deals 5 more base damage",
				"copy3" : "Shoots more frequently",
				"copy4" : "Lazer deals 5 more base damage",
				"copy5" : "Shoots even more frequently" 
				},
			"Portrait" : nyao,
			"BorderColor" : nyaoborder,
			"BGColor" : nyaotext,
		},
		"Grove": {
			"Names": {
				"Title": "Grove",
				"Title2": "Grove UPGRADE",
			},
			"Descriptions": {
				"copy1" : "Does not attack, instead grows to produce valuables",
				"copy2" : "Grows faster",
				"copy3" : "Harvests yeild more",
				"copy4" : "Grows even faster",
				"copy5" : "Grows even faster and harvests yeild more when Grove touches enemies",
				},
			"Portrait" : grove,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
	},
	"Items": {
		
	},
}
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#prints(title, description, type, text_color, border_color, portrait)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	emit_signal("card_selected")

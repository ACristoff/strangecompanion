extends TextureButton

#DOLLS

@onready var lodey = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var stabbey = preload("res://Assets/Debug_Assets/stabbey_sketch.png")
@onready var mami = preload("res://Assets/Debug_Assets/mami_sketch.png")
@onready var kanon = preload("res://Assets/Debug_Assets/kanon_sketch.png")
@onready var hacke = preload("res://Assets/Debug_Assets/hacke_sketch.png")
@onready var dune = preload("res://Assets/Debug_Assets/dune_sketch.png")
@onready var riff = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var oora = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var bawl = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var grove = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var nyao = preload("res://Assets/Debug_Assets/PointerFire.png")

#GEMS

@onready var red = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var blue = preload("res://Assets/Debug_Assets/PointerFire.png")
@onready var yellow = preload("res://Assets/Debug_Assets/PointerFire.png")

#ITEMS

#COLORS

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

#RIFF COLORS

#BAWL COLORS

#GROVE COLORS

#MISSING ASSETS
var nullborder = Color.from_hsv(0.0, 0.0, 0.0, 1)
var nulltext = Color.from_hsv(0.0, 0.0, 30.0, 1)

var card_types =  {
	"Gems": {
		"Red": {
			"Description": "You see memories of destruction and despair" ,
			"Portrait" : red,
			"BorderColor" : null,
			"BGColor" : null,
		},
		"Blue": {
			"Description": "You see memories of a relentless storm",
			"Portrait" : blue,
			"BorderColor" : null,
			"BGColor" : null,
		},
		"Yellow": {
			"Description": "You see memories of a calm river in summer",
			"Portrait" : yellow,
			"BorderColor" : null,
			"BGColor" : null,
		},
	},
	"Dolls": {
		"Stabbey": {
			"Description": "Weilds a blade and spins around.",
			"Portrait" : stabbey,
			"BorderColor" : stabbeyborder,
			"BGColor" : stabbeytext,
		},
		"Lodey": {
			"Description": "Uses long-range simple projectiles shot away from the player.",
			"Portrait" : lodey,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Mami": {
			"Description": "Cooks for the team or for the enemies, throwing her food up into the air.",
			"Portrait" : mami,
			"BorderColor" : mamiborder,
			"BGColor" : mamitext,
		},
		"Kanon": {
			"Description": "Sits in a specialized tank, shooting in a cross and X pattern cyclically.",
			"Portrait" : kanon,
			"BorderColor" : kanonborder,
			"BGColor" : kanontext,
		},
		"Hacke": {
			"Description": "Draws selection squares that can hit groups of enemies.",
			"Portrait" : hacke,
			"BorderColor" : hackeborder,
			"BGColor" : hacketext,
		},
		"Oora": {
			"Description": "Lazes around most the time keeping you safe in a small circle.",
			"Portrait" : oora,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Dune": {
			"Description": "Shoots sandstorms in random directions.",
			"Portrait" : dune,
			"BorderColor" : duneborder,
			"BGColor" : dunetext,
		},
		"Bawl": {
			"Description": "Curls in a ball and protects you from incoming attacks.",
			"Portrait" : bawl,
			"BorderColor" : nullborder,
			"BGColor" :  nulltext,
		},
		"Riff": {
			"Description": "Her music is electric.",
			"Portrait" : riff,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Nyao": {
			"Description": "Uses a lazer to decimate enemies.",
			"Portrait" : nyao,
			"BorderColor" : nullborder,
			"BGColor" : nulltext,
		},
		"Grove": {
			"Description": "Does not attack, instead opting to support the team in other ways.",
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

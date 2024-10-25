extends Control

@onready var card1 = $Card
@onready var card2 = $Card2
@onready var card3 = $Card3

@onready var cardfinal1 = $HBoxContainer/CardPNT
@onready var cardfinal2 = $HBoxContainer/Card2PNT
@onready var cardfinal3 = $HBoxContainer/Card3PNT

@onready var cardtop1 = $card1topPNT
@onready var cardtop2 = $card2topPNT
@onready var cardtop3 = $card3topPNT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#cardfinal1.pivot_offset = cardfinal1.size/2
	#cardfinal2.pivot_offset = cardfinal2.size/2
	#cardfinal3.pivot_offset = cardfinal3.size/2
	#card1.pivot_offset = card1.size/2
	#card2.pivot_offset = card2.size/2
	#card3.pivot_offset = card3.size/2
	card_movement()


func card_movement():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(card1, "position", $card1topPNT.position, 0)
	tween.tween_property(card1, "global_position", $CardPNT.global_position, .3)
	tween.tween_callback(card_flip1)
	tween.tween_property(card2, "position", $card2topPNT.position, 0)
	tween.tween_property(card2, "global_position", $Card2PNT.global_position, .3)
	tween.tween_callback(card_flip2)
	tween.tween_property(card3, "position", $card3topPNT.position, 0)
	tween.tween_property(card3, "global_position", $Card3PNT.global_position, .3)
	tween.tween_callback(card_flip3)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func card_flip1():
	print("hoi")
	$Card/AnimationPlayer.play("card_flip (2)")
func card_flip2():
	$Card2/AnimationPlayer.play("card_flip (2)")
func card_flip3():
	$Card3/AnimationPlayer.play("card_flip (2)")

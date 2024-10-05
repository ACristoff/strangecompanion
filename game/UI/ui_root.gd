extends Control

# score and essense meters
var score: int = 0
var essence_meter_1: int = 0
var essence_meter_2: int = 0
var essence_meter_3: int = 0

const MAX_ESSENCE_METER_1: int = 100
const MAX_ESSENCE_METER_2: int = 100
const MAX_ESSENCE_METER_3: int = 100

func _ready():
	update_score_label()
	update_meters()

# function to add points to the score
func add_score(points: int):
	score += points
	update_score_label()

# update the score label
func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)

# functions to update essence meters
func add_to_essence_meter_1(amount: int):
	essence_meter_1 = min(essence_meter_1 + amount, MAX_ESSENCE_METER_1)
	update_meters()

func add_to_essence_meter_2(amount: int):
	essence_meter_2 = min(essence_meter_2 + amount, MAX_ESSENCE_METER_2)
	update_meters()

func add_to_essence_meter_3(amount: int):
	essence_meter_3 = min(essence_meter_3 + amount, MAX_ESSENCE_METER_3)
	update_meters()

#update the meters display
func update_meters():
	$EssenceMeter_1.value = essence_meter_1
	$EssenceMeter_2.value = essence_meter_2
	$EssenseMeter_3.value = essence_meter_3

# Show fail state menu
func show_fail_menu():
	$FailStateMenu.visible = true
	$MainMenu.visible = false

# button functionality for main menu

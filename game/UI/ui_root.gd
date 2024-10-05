extends Control

# Score and essence meters
var score: int = 0
var essence_meter_1: int = 0
var essence_meter_2: int = 0
var essence_meter_3: int = 0

var high_score: int = 0  # Simple high score variable

const MAX_ESSENCE_METER_1: int = 100
const MAX_ESSENCE_METER_2: int = 100
const MAX_ESSENCE_METER_3: int = 100

func _ready():
	update_score_label()
	update_meters()
	$FailStateMenu.visible = false  # Hide fail menu initially
	$UpgradeMenu.visible = false      # Hide upgrade menu initially

func add_score(points: int):
	score += points
	update_score_label()
	check_high_score()

func check_high_score():
	if score > high_score:
		high_score = score  # Update high score if current score is higher

func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)
	$HighScoreLabel.text = "High Score: " + str(high_score)

func add_to_essence_meter_1(amount: int):
	essence_meter_1 = min(essence_meter_1 + amount, MAX_ESSENCE_METER_1)
	update_meters()

func add_to_essence_meter_2(amount: int):
	essence_meter_2 = min(essence_meter_2 + amount, MAX_ESSENCE_METER_2)
	update_meters()

func add_to_essence_meter_3(amount: int):
	essence_meter_3 = min(essence_meter_3 + amount, MAX_ESSENCE_METER_3)
	update_meters()

func update_meters():
	$EssenceMeter_1.value = essence_meter_1
	$EssenceMeter_2.value = essence_meter_2
	$EssenceMeter_3.value = essence_meter_3

func show_fail_menu():
	$FailStateMenu.visible = true
	$MainGameUI.visible = false  # Hide the main game UI
	$UpgradeMenu.visible = false   # Hide upgrade menu when failed

func restart_game():
	score = 0
	essence_meter_1 = 0
	essence_meter_2 = 0
	essence_meter_3 = 0
	update_score_label()
	update_meters()
	$FailStateMenu.visible = false
	$MainGameUI.visible = true

func quit_game():
	get_tree().quit()

func start_game():
	$MainMenu.visible = false
	$MainGameUI.visible = true

func open_upgrade_menu():
	$UpgradeMenu.visible = true
	$MainGameUI.visible = false

func close_upgrade_menu():
	$UpgradeMenu.visible = false
	$MainGameUI.visible = true

func check_fail_condition():
	if essence_meter_1 <= 0 and essence_meter_2 <= 0 and essence_meter_3 <= 0:
		show_fail_menu()

func _on_quit_button_pressed() -> void:
	quit_game()

func _on_retry_button_pressed() -> void:
	restart_game()

func _on_upgrade_button_pressed():
	open_upgrade_menu()

func _on_close_upgrade_menu_pressed():
	close_upgrade_menu()

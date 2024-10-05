extends Control

# Score and essence meters
#var score: int = 0
#var essence_meter_1: int = 0
#var essence_meter_2: int = 0
#var essence_meter_3: int = 0

#var high_score: int = 0  # Simple high score variable

#const MAX_ESSENCE_METER_1: int = 100
#const MAX_ESSENCE_METER_2: int = 100
#const MAX_ESSENCE_METER_3: int = 100
pass

func _ready():
	#update_score_label()
	#update_meters()
	#$FailStateMenu.visible = false  # Hide fail menu initially
	#$UpgradeMenu.visible = false      # Hide upgrade menu initially
	pass
	
func _process(delta: float) -> void:
	$Node/EssenceMeter_1.value = JuicyDetails.bar_1
	$Node/EssenceMeter_2.value = JuicyDetails.bar_2
	$Node/EssenseMeter_3.value = JuicyDetails.bar_3

func add_score(points: int):
	#score += points
	#update_score_label()
	#check_high_score()
	pass

func check_high_score():
	#if score > high_score:
		#high_score = score  # Update high score if current score is higher
	pass

func update_score_label():
	#$ScoreLabel.text = "Score: " + str(score)
	#$HighScoreLabel.text = "High Score: " + str(high_score)
	pass

func add_to_essence_meter_1(amount: int):
	#essence_meter_1 = min(essence_meter_1 + amount, MAX_ESSENCE_METER_1)
	#update_meters()
	pass

func add_to_essence_meter_2(amount: int):
	#essence_meter_2 = min(essence_meter_2 + amount, MAX_ESSENCE_METER_2)
	#update_meters()
	pass

func add_to_essence_meter_3(amount: int):
	#essence_meter_3 = min(essence_meter_3 + amount, MAX_ESSENCE_METER_3)
	#update_meters()
	pass

func update_meters():
	#$Node/EssenceMeter_1.value = essence_meter_1
	#$Node/EssenceMeter_2.value = essence_meter_2
	#$Node/EssenseMeter_3.value = essence_meter_3
	pass

func show_fail_menu():
	#$FailStateMenu.visible = true
	#$MainGameUI.visible = false  # Hide the main game UI
	#$UpgradeMenu.visible = false   # Hide upgrade menu when failed
	pass

func restart_game():
	#score = 0
	#essence_meter_1 = 0
	#essence_meter_2 = 0
	#essence_meter_3 = 0
	#update_score_label()
	#update_meters()
	#$FailStateMenu.visible = false
	#$MainGameUI.visible = true
	pass

func quit_game():
	#get_tree().quit()
	pass

func start_game():
	#$MainMenu.visible = false
	#$MainGameUI.visible = true
	pass

func open_upgrade_menu():
	#$UpgradeMenu.visible = true
	#$MainGameUI.visible = false
	pass

func close_upgrade_menu():
	#$UpgradeMenu.visible = false
	#$MainGameUI.visible = true
	pass

func check_fail_condition():
	#if essence_meter_1 <= 0 and essence_meter_2 <= 0 and essence_meter_3 <= 0:
		#show_fail_menu()
	pass

func _on_quit_button_pressed() -> void:
	#quit_game()
	pass

func _on_retry_button_pressed() -> void:
	#restart_game()
	pass

func _on_upgrade_button_pressed():
	#open_upgrade_menu()
	pass

func _on_close_upgrade_menu_pressed():
	#close_upgrade_menu()
	pass

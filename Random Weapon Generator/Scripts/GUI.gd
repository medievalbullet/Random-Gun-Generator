extends Control

onready var generate_button = get_node("Container/Button")

onready var github_button = get_node("Github")



onready var damage_bar = get_node("AllStats/Damage/ProgressBar")

onready var firerate_bar = get_node("AllStats/FireRate/ProgressBar")

onready var accuracy_bar = get_node("AllStats/Accuracy/ProgressBar")

onready var range_bar = get_node("AllStats/Range/ProgressBar")

onready var puncture_bar = get_node("AllStats/Puncture/ProgressBar")

onready var movementspeed_bar = get_node("AllStats/MovementSpeed/ProgressBar")

onready var magazinesize_text = get_node("AllStats2/MagazineSize/LineText")

onready var extraammo_text = get_node("AllStats2/ExtraAmmo/LineText")

onready var reloadtime_text = get_node("AllStats2/ReloadTime/LineText")

onready var suppressed_text = get_node("EvenMore/Suppressed")

onready var scopetype_text = get_node("EvenMore/ScopeType")

onready var balance_text = get_node("BalanceInfo/InfoHolder/BalanceText")

onready var balance_bar = get_node("BalanceInfo/InfoHolder/BalanceBar")

onready var balance_text_value = get_node("BalanceInfo/InfoHolder/BalanceTextValue")

var above50 : int = 0
var allthestats

var stats_array = [damage_bar, firerate_bar, accuracy_bar,
range_bar, puncture_bar, movementspeed_bar]

var scope_types = ["No Scope", "No Scope", "No Scope", "No Scope", "No Scope", "Holographic", "Holographic", 
"Red Dot", "Red Dot", "2x", "4x", "8x" ]

func _on_Button_pressed() -> void:
	
	var rng = RandomNumberGenerator.new()
	
	rng.randomize()
	
	damage_bar.value = rng.randi() % 100 + 1
	
	firerate_bar.value = rng.randi() % 100 + 1
	
	accuracy_bar.value = rng.randi() % 100 + 1
	
	range_bar.value = rng.randi() % 100 + 1
	
	movementspeed_bar.value = rng.randi() % 100 + 1
	
	puncture_bar.value = rng.randi() % 100 + 1
	
	allthestats = damage_bar.value + firerate_bar.value + accuracy_bar.value + range_bar.value
	+ range_bar.value
	
	allthestats += movementspeed_bar.value
	
	var magazine_size = rng.randi() % 50 + 1
	
	magazinesize_text.text = str(magazine_size)
	
	extraammo_text.text = str((rng.randi() % 15 + 1) * magazine_size)
	
	reloadtime_text.text = str(rng.randi() % 4 + 1) + "." + str(rng.randi() % 9 + 0)
	
	var supp_rand = rng.randi() % 7 + 0
		
	if supp_rand == 0:
			
		suppressed_text.text = "Yes"
		
	if supp_rand >= 1:
		
		suppressed_text.text = "No"
		
	scopetype_text.text = str(scope_types[rng.randi() % 11 + 0])
	
	
	
	if allthestats <= 150:
		
		balance_text.text = "Watergun"
		
		balance_text.modulate.r = 0
		balance_text.modulate.g = 1
		balance_text.modulate.b = 2
		
		balance_bar.modulate.r = 0
		balance_bar.modulate.g = 1
		balance_bar.modulate.b = 2
		
		balance_bar.value = 18
		
		pass
	
	if allthestats >= 151:
		if allthestats < 180:
			
			balance_text.text = "Underpowered"
			
			balance_text.modulate.r = 0
			balance_text.modulate.g = 2
			balance_text.modulate.b = 2
			
			balance_bar.modulate.r = 0
			balance_bar.modulate.g = 2
			balance_bar.modulate.b = 2
			
			balance_bar.value = 42
			
			pass

	if allthestats >= 181 :
		if allthestats < 220:
			
			balance_text.text = "Balanced"
			
			balance_text.modulate.r = 0
			balance_text.modulate.g = 2
			balance_text.modulate.b = 0
			
			balance_bar.modulate.r = 0
			balance_bar.modulate.g = 2
			balance_bar.modulate.b = 0
			
			balance_bar.value = 50
			
			pass

	if allthestats >= 221 :
		if allthestats < 270:
			
			balance_text.text = "Slighly Strong"
			
			balance_text.modulate.r = 2
			balance_text.modulate.g = 2
			balance_text.modulate.b = 0
			
			balance_bar.modulate.r = 2
			balance_bar.modulate.g = 2
			balance_bar.modulate.b = 0
			
			balance_bar.value = 58
			
			pass

	if allthestats >= 271 :
		if allthestats < 320:
			
			balance_text.text = "Overpowered"
			
			balance_text.modulate.r = 2
			balance_text.modulate.g = 1
			balance_text.modulate.b = 0
			
			balance_bar.modulate.r = 2
			balance_bar.modulate.g = 1
			balance_bar.modulate.b = 0
			
			balance_bar.value = 72
			
			pass
	
	if allthestats >= 321 :
	
		
		balance_text.text = "WAYTOODANK"
		
		balance_text.modulate.r = 2
		balance_text.modulate.g = 0
		balance_text.modulate.b = 0
		
		balance_bar.modulate.r = 2
		balance_bar.modulate.g = 0
		balance_bar.modulate.b = 0
		
		balance_bar.value = 100
		
		pass
	
	balance_text_value.text = "Power Score: "
	
	balance_text_value.text += str(allthestats)
	
	print(allthestats)
	
	pass


func _on_Github_pressed() -> void:

	OS.shell_open("https://github.com/MasterShaff/Random-Gun-Generator")

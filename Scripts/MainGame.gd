extends Node2D

var money = 20
var health = 10
var subscription = 0

var inWave = false
var wave = 0
var enemies_left = 0

#tower spawning
var towerSelect = 0
var instanceTower
var building = false
var cost

var tower1 = preload("res://Towers/tower.tscn")

var inventoryOn = false;
var invOpen
var invClosed

func _ready():
	invOpen = get_node("GUI/Inventory/Open")
	invClosed = get_node("GUI/Inventory/Closed")
	
	
	#for filePath in DirAccess.get_files_at("res://Towers/"):
	#	if filePath.get_extension() == "tscn":  
	#		towers.append( load(filePath) )

func _process(delta):
	$GUI/Money.text = "P-Bucks: " + str (money)

func _on_inventory_button_pressed():
	if !building:
		if inventoryOn == false:
			invOpen.show()
			invClosed.hide()
			inventoryOn = true
		else:
			invOpen.hide()
			invClosed.show()
			inventoryOn = false


func _on_tower1_button_pressed():
	if building == false:
		if towerSelect == 0 and money >= 10:
			invOpen.hide()
			invClosed.show()
			inventoryOn = false
			instanceTower = tower1.instantiate()
			cost = 10
			building = true
			add_child(instanceTower)

func tower_built():
	building = false
	money -= cost

func cancel():
	building = false

func game_over():
	pass

func _on_open_shop():
	pass # Replace with function body.

func add_money(coin):
	money += coin

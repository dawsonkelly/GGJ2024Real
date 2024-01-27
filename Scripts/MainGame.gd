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
var towers:Array[Resource]
var building = false

var inventoryOn = false;
var invOpen
var invClosed

func _ready():
	invOpen = get_node("Inventory/Open")
	invClosed = get_node("Inventory/Closed")
	
	for filePath in DirAccess.get_files_at("res://Towers/"):
		if filePath.get_extension() == "tres":  
			towers.append( load(filePath) )


func _on_Spawn_Tower():
	if building == false:
		if towerSelect == 0 and money >= 10:
			instanceTower = towers[0]


func _on_inventory_button_pressed():
	if inventoryOn == false:
		invOpen.show()
		invClosed.hide()
		inventoryOn = true
	else:
		invOpen.hide()
		invClosed.show()
		inventoryOn = false

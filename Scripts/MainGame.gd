extends Node2D

var money = 100
var health = 5#packages
var subscription = false

var difficulty = 1 # for storing difficulty as 1 2 or 3

var inWave = false
var wave = 0
var enemies_left = 0

#tower spawning
var towerSelect = 0
var instanceTower
var building = false
var cost

var tower1 = preload("res://Towers/tower.tscn")
var tower2 = preload("res://Towers/battery.tscn")
var tower3 = preload("res://Towers/pool.tscn")

var inventoryOn = false;
var invOpen
var invClosed

@export var shopWindow : Node2D
@export var shopSprite : Sprite2D
@export var shopButton : TextureButton
@export var premiumTexture : Texture2D
@export var premiumButton : TextureButton
@export var upgradeButton : TextureButton


func _ready():
	invOpen = get_node("GUI/Inventory/Open")
	invClosed = get_node("GUI/Inventory/Closed")
	difficulty = get_node("/root/GlobalVariables").difficulty
	
	#for filePath in DirAccess.get_files_at("res://Towers/"):
	#	if filePath.get_extension() == "tscn":  
	#		towers.append( load(filePath) )
	#skfjl

func _process(delta):
	$GUI/Money.text = "P-Bucks: " + str (money)
	$GUI/Money2.text = "Packages: " + str(health)

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
		if money >= 10: #make it so costs money AND health(packages)
			invOpen.hide()
			invClosed.show()
			inventoryOn = false
			instanceTower = tower1.instantiate()
			cost = 10
			building = true
			add_child(instanceTower)

func _on_tower2_button_pressed():
	if building == false:
		if  money >= 15: #make it so costs money AND health(packages)
			invOpen.hide()
			invClosed.show()
			inventoryOn = false
			instanceTower = tower2.instantiate()
			cost = 15
			building = true
			add_child(instanceTower)

func _on_tower3_button_pressed():
	if building == false:
		if  money >= 20: #make it so costs money AND health(packages)
			invOpen.hide()
			invClosed.show()
			inventoryOn = false
			instanceTower = tower3.instantiate()
			cost = 20
			building = true
			add_child(instanceTower)

func tower_built():
	building = false
	money -= cost

func cancel():
	building = false

func take_damage():
	health -= 1
	if health <= 0:
		game_over()

func game_over():
	#go to new scene
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_open_shop():
	cancel()
	shopButton.hide()
	shopWindow.show()
	
func _on_close_shop():
		cancel()
		shopButton.show()
		shopWindow.hide()

func add_money(coin):
	money += coin

func _on_premium():
	if money >= 69:
		money -= 69
		subscription = true
		health += 5
		premiumButton.hide()
		shopSprite.texture = premiumTexture





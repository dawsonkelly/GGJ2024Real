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

func _ready():
	for filePath in DirAccess.get_files_at("res://Towers/"):
		if filePath.get_extension() == "tres":  
			towers.append( load(filePath) )


func _on_Spawn_Tower():
	if building == false:
		if towerSelect == 0 and money >= 10:
			instanceTower = towers[0]

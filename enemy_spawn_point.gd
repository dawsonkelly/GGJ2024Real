extends Node2D

var spawntime = 3


func _ready():#spawns enemies every spawntime seconds
	await get_tree().create_timer(3).timeout
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

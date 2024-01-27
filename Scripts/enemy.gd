extends PathFollow2D

#spawn
var enter = false

#If the enemy is on it's way in or out
var goinIn = true

var health = 1

@export var speed = 100

func _process(delta):
	if enter:
		set_progress(0)
		enter = true
	if goinIn:
		set_progress(get_progress() + speed*delta)
	
	else:
		set_progress(get_progress() + (-speed)*delta)
	
	if get_progress_ratio() == 1:
		goinIn = false

func hit():
	print("IVE BEEN HIT IN THE BUTT OWWWWWW")
	get_node("/root/Game/").add_money(1)
	queue_free()


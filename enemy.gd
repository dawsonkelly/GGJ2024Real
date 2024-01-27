extends CharacterBody2D

#If the enemy is on it's way in or out
var enter = true

@export var speed = 100

func _process(delta):
	if enter:
		get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	else:
		get_parent().set_progress(get_parent().get_progress() - speed*delta)
	
	if get_parent().get_progress_ratio() == 1:
		enter = false

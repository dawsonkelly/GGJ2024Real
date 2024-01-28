
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_entered(area):#look for pirate entering area!!
	if area.is_in_group("Enemy"):
		if area.get_parent().dead:
			pass
		else:
			pass
			#if we want to take damage to the porch here

extends Area2D

var bulletSpeed = 5
var target
var dir = Vector2.ZERO
var move = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.look_at(target.global_position)
	dir = (target.global_position - global_position).normalized()
	#$BulletDespawnTimer.start()


func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(dir, delta)
	move = move.normalized() * bulletSpeed
	global_position += move




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):#an area has entered the bullet
	print("bullet entered something")
	if area.is_in_group("Enemy"):
		if area.get_parent().dead:
			pass
		else:
			area.get_parent().hit()
			queue_free()



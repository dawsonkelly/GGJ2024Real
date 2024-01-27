extends Area2D

var bulletSpeed = 450
var target
var dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.look_at(target.global_position)
	dir = (target.global_position - global_position).normalized()
	#$BulletDespawnTimer.start()


func _physics_process(delta):
	#var collision = move_and_collide((dir.normalized()) * bulletSpeed * delta)
	var collision = false#temp
	if collision:
		print("I collided with ", collision.get_collider().name)
		if collision.get_collider().is_in_group("Enemy"):#hit enemy and die
			collision.getcollider().hit()
			queue_free()




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

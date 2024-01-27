extends CharacterBody2D

var bulletSpeed = 450

# Called when the node enters the scene tree for the first time.
func _ready():
	$BulletDespawnTimer.start()


func _physics_process(delta):
	var collision = move_and_collide((velocity + Vector2(1,0)) * bulletSpeed * delta)
	if collision:
		#print("I collided with ", collision.get_collider().name)
		if collision.get_collider().has_method("hit"):
			collision.getcollider().hit()
			queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

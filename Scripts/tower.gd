extends StaticBody2D

var bulletPath = preload ("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$TowerShootTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tower_shoot_timer_timeout():#bang!
	shoot()

func shoot():
	var bullet = bulletPath.instantiate()#spawn bullet that eventually deletes itself
	
	#add code here that rotates bullet
	add_child(bullet)
	
	

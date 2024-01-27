extends StaticBody2D

@export var bulletScene : PackedScene

var enemies = []
var current_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	$TowerShootTimer.start()


func _physics_process(delta):
	pass #keep track of enemies?


func _on_tower_shoot_timer_timeout():#bang!
	if enemies != []:
		current_enemy = enemies[0]#selects first enemy to enter radius
		shoot()

func shoot():
	var bullet = bulletScene.instantiate()
	bullet.target = current_enemy#give bullet enemy
	add_child(bullet)#spawn bullet that eventually deletes itself


func _on_shoot_radius_area_entered(area):
	print("entered!")
	if area.is_in_group("Enemy"):
		print("enemy!")
		enemies.append(area)


func _on_shoot_radius_area_exited(area):
	if area.is_in_group("Enemy"):
		enemies.erase(area)

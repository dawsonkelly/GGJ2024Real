extends StaticBody2D

@export var bulletScene : PackedScene

var enemies = []
var current_enemy

var building = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$TowerShootTimer.start()


func _physics_process(delta):
	if building == false:
		pass
	else:
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("click"):
			building = false
			get_parent().tower_built()
		if Input.is_action_just_pressed("cancel"):
			get_parent().cancel()
			queue_free()
			
	#keep track of enemies?


func _on_tower_shoot_timer_timeout():#bang!
	if building == false:
		if enemies != []:
			current_enemy = enemies[0]#selects first enemy to enter radius
			shoot()

func shoot():
	var bullet = bulletScene.instantiate()
	bullet.target = current_enemy#give bullet enemy
	add_child(bullet)#spawn bullet that eventually deletes itself


func _on_shoot_radius_area_entered(area):
	#print("entered!")
	if area.is_in_group("Enemy"):
		if building == false:
			#print("enemy!")
			enemies.append(area)


func _on_shoot_radius_area_exited(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.erase(area)

extends StaticBody2D

@export var bulletScene : PackedScene

var enemies = []
var current_enemy

var building = true
@export var towerType = 0

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
			for e in enemies:
				if e.get_parent().dead:
					enemies.erase(current_enemy)
		if towerType == 0:
				current_enemy = enemies[0]#selects first enemy to enter radius
				shoot(current_enemy)
		if towerType == 1:
			if enemies != []:
				for i in enemies:
					shoot(i);

func shoot(target):
	var bullet = bulletScene.instantiate()
	bullet.target = target#give bullet enemy
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


func _on_upgrade_pressed():
	pass # Replace with function body.

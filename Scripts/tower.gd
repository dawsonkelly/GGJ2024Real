extends StaticBody2D

@export var bulletScene : PackedScene

var enemies = []
var current_enemy
var isAttacking = false

var building = true
@export var towerType = 0

@export var sprite1 : Sprite2D
@export var sprite2 : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if towerType != 2:
		$TowerShootTimer.start()
	else:
		sprite1.show()
		sprite2.hide()


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
		if towerType == 2:
			sprite1.show()
			sprite2.hide()
			isAttacking = false
			$TowerShootTimer.stop()
		else:
			if enemies != []:
				for e in enemies:
					if e.get_parent().dead:
						enemies.erase(current_enemy)
			if towerType == 0 and enemies != []:
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
			if(towerType != 2):
				enemies.append(area)
			else:
				if !isAttacking:
					area.queue_free()
					sprite1.hide()
					sprite2.show()
					isAttacking = true;
					$TowerShootTimer.start()


func _on_shoot_radius_area_exited(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.erase(area)


func _on_upgrade_pressed():
	pass # Replace with function body.

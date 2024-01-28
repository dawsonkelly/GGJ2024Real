extends PathFollow2D

#spawn
var enter = false

#If the enemy is on it's way in or out
var goinIn = true
@export var dead = false

@export var health = 2

var hasPackage = false

@export var speed = 10#test at 1000

@export var regTex : Texture
@export var runTex : Texture
@export var package : Sprite2D


@export var packageScene : PackedScene

var sprite

func _ready():
		sprite = get_node("Area2D/Image")
		package.hide()

func _process(delta):
	if enter:
		set_progress(0)
		enter = true
	if goinIn:
		set_progress(get_progress() + speed*delta)
	
	else:
		set_progress(get_progress() - (speed*delta))
	
	if get_progress_ratio() == 1:
		take_package()
	if get_progress_ratio() == 0 and goinIn == false:
		return_to_ship()

func hit(damage):
	health -= damage
	if health <= 0:
		remove_from_group("Enemy")
		goinIn = false;
		dead = true
		if hasPackage:
			hasPackage = false;
			package.hide()
		sprite.set_texture(runTex)#crashes rn
		print("IVE BEEN HIT IN THE BUTT OWWWWWW")
		get_node("/root/Game/").add_money(1)
		get_node("/root/Game/Path2D").enemies -= 1
		#queue_free()

func take_package():
	hasPackage = true
	package.show()
	goinIn = false;

func return_to_ship():
	#if not dead they have a package
	if dead == false and hasPackage:
		get_node("/root/Game/").take_damage()
	queue_free()


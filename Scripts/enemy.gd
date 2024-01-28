extends PathFollow2D

#spawn
var enter = false

#If the enemy is on it's way in or out
var goinIn = true
@export var dead = false

var health = 1

var hasPackage = false

@export var speed = 100

@export var regTex : Texture
@export var runTex : Texture

var sprite

func _ready():
		sprite = get_node("Area2D/Sprite")

func _process(delta):
	if enter:
		set_progress(0)
		enter = true
	if goinIn:
		set_progress(get_progress() + speed*delta)
	
	else:
		set_progress(get_progress() - (speed*delta))
	
	if get_progress_ratio() == 1:
		goinIn = false
	if get_progress_ratio() == 0 and goinIn == false:
		queue_free()

func hit():
	remove_from_group("Enemy")
	hasPackage = false;
	goinIn = false;
	dead = true
	sprite.set_texture(runTex)#crashes rn
	print("IVE BEEN HIT IN THE BUTT OWWWWWW")
	get_node("/root/Game/").add_money(1)
	#queue_free()


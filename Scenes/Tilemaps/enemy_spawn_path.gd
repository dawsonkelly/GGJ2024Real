extends Node2D

var spawnTime = 3
var enemy
var enemies = 0
@export var pirates : Array[PackedScene]
var timer
var wave = 0
@export var waves : Array[PackedScene]
@export var waveButton : Sprite2D

var small
var big
var pir

# Called when the node enters the scene tree for the first time.
func _ready():
	#timer = $EnemySpawnTimer as Timer
	#timer.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_spawn_timer_timeout():#spawn enemy
	var r = RandomNumberGenerator.new()
	r.randomize()
	var num = r.randi_range(0, 2)
	if small > 0 and num == 0:
		enemy = pirates[0].instantiate()
		add_child(enemy)
		small -= 1
		enemies += 1
	elif pir > 0 and num == 1:
		enemy = pirates[1].instantiate()
		add_child(enemy)
		pir -= 1
		enemies += 1
	elif big > 0 and num == 2:
		enemy = pirates[2].instantiate()
		add_child(enemy)
		big -= 1
		enemies += 1
	else:
		if small > 0:
			enemy = pirates[0].instantiate()
			add_child(enemy)
			small -= 1
			enemies += 1
		elif pir > 0:
			enemy = pirates[1].instantiate()
			add_child(enemy)
			pir -= 1
			enemies += 1
		elif big > 0:
			enemy = pirates[2].instantiate()
			add_child(enemy)
			big -= 1
			enemies += 1
		elif enemies <= 0:
			wave_end()
	print_debug(big)

func start_wave():
	waveButton.hide()
	wave += 1
	timer = $EnemySpawnTimer as Timer
	var curwave = waves[wave].instantiate()
	timer.wait_time = curwave.spawnTime
	timer.start()
	small = curwave.smallPirate
	pir = curwave.pirate
	big = curwave.bigPirate

func wave_end():
	timer.stop()
	waveButton.show()

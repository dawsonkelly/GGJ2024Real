extends Node2D

var spawnTime = 3
@export var enemyScene : PackedScene
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $EnemySpawnTimer as Timer
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_spawn_timer_timeout():#spawn enemy
	var enemy = enemyScene.instantiate()
	add_child(enemy)

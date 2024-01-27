extends Node2D

var spawnTime = 3
var enemyPath = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemySpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_spawn_timer_timeout():#spawn enemy
	var enemy = enemyPath.instantiate()
	add_child(enemy)

extends Node2D

@export var ads : Array[Node2D]
var r = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$AdTimer.start()
	for i in (len(ads)-1):
		ads[i].hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():#pop up every few seconds
	r.randomize()
	var num = r.randi_range(0, (len(ads)-1))
	print(num)
	ads[num].show()

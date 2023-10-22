extends StaticBody2D

var totalTime = 15
var currTime
var units = 0
@onready var bar = $ProgressBar
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	currTime = totalTime
	bar.max_value = totalTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.value = currTime
	if currTime <= 0:
		mineEmpty()
	


func _on_chop_area_body_entered(body):
	if "Unit" in body.name:
		units += 1
		startDiggingGold()


func _on_chop_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if "Unit" in body.name:
		units -= 1
		if(units <= 0):
			timer.stop()


func _on_timer_timeout():
	currTime -= 1*units
	var tween = get_tree().create_tween()
	tween.tween_property(bar, "value", currTime, 0.5).set_trans(Tween.TRANS_LINEAR)
	
	
func startDiggingGold():
	timer.start()
	
		
func mineEmpty():	
	Game.Gold += 20
	queue_free()
	
		

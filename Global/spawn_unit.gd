extends Node2D

@onready var unit = preload("res://units/unit.tscn")

var housePos = Vector2(300,300);

func _on_yes_pressed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomPosX = rng.randi_range(-100,100)
	var randomPosY = rng.randi_range(80,110)
	var unitPath = get_tree().get_root().get_node("world/Units")
	var worldPath = get_tree().get_root().get_node("world")
	var unit1 = unit.instantiate()
	unit1.name = "Unit" + str(unit1.get_instance_id())

	unit1.position = housePos + Vector2(randomPosX, randomPosY)
	unitPath.add_child(unit1)
	worldPath.get_units()


func _on_no_pressed():
	var housePath = get_tree().get_root().get_node("world/Buildings")
	for i in housePath.get_child_count():
		if housePath.get_child(i).Selected == true:
			housePath.get_child(i).Selected = false
			
	queue_free()

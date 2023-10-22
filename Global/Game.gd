extends Node

@onready var spawn = preload("res://Global/spawn_unit.tscn")

var Wood = 0
var Gold = 0
var Food = 0

func spawnUnit(pos):
	var path = get_tree().get_root().get_node("world/UI")
	var hasSpawn = false
	for i in path.get_child_count():
		if "SpawnUnit" in path.get_child(i).name:
			hasSpawn = true
	if hasSpawn == false:		
		var spawnUnit = spawn.instantiate()
		spawnUnit.housePos = pos
		path.add_child(spawnUnit)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

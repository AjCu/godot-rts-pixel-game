extends Node2D


var units = []

# Called when the node enters the scene tree for the first time.
func _ready():
	units = get_tree().get_nodes_in_group("unit")



func _on_area_selected(object):
	var start = object.start
	var end = object.end
	var area = []
	area.append(Vector2(min(start.x, end.x), min(start.y, end.y)))
	area.append(Vector2(max(start.x, end.x), max(start.y, end.y)))
	var ut = get_units_in_area(area)
	for u in units:
		u.set_selected(false)
	for u in ut:
		u.set_selected(!u.selected)


func get_units_in_area(area):
	var u = []
	for unit in units:
		if unit.position.x > area[0].x  and unit.position.x < area[1].x:
			if unit.position.y > area[0].y  and unit.position.y < area[1].y:
				u.append(unit)
	return u

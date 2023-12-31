extends CharacterBody2D


@export var selected = false
@onready var box = get_node("Box")
@onready var anim = get_node("AnimationPlayer")

@onready var target = position
var follow_cursor = false

var Speed = 70
func _ready():
	set_selected(selected)
	add_to_group("Units",true)
	
	


func set_selected(value):
	selected = value
	box.visible = value	




func _on_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("RightClick"):
		follow_cursor = true
	if event.is_action_released("RightClick"):
		follow_cursor = false	
		
func _physics_process(delta):
	if follow_cursor == true:
		if selected == true:
			target = get_global_mouse_position()
			anim.play('Walk Down')
	velocity = position.direction_to(target)*Speed	
	if position.distance_to(target) > 20:
		move_and_slide()
	else:
		anim.stop()			

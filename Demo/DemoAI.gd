#Refference is   https://www.youtube.com/watch?v=iSpWZzL2i1o

#this is the goat

extends KinematicBody2D

var selected = false;
signal demoaiturnfinished
var allowturn = false;


var maximum_distance = 200

var minimum_distance = 60

var location


func _ready():
	location =  get_position();

#onready var TURN = get_node("/root/DemoLevel")
#var Turn = TURN.turn
#var Turn = "Drag and drop"
#var TURN = "far"

#func _physics_process(delta):
#	if TURN.turn == "Demo ai":
#		if selected:
#			global_position = lerp(global_position, get_global_mouse_position(),50*delta)
#	

func _physics_process(delta):
		if selected and get_parent().player2==true:
			global_position = lerp(global_position, get_global_mouse_position(),50*delta)
		else:
			global_position = lerp(global_position, location,10*delta)
		
		if($RayCastDown.is_colliding()):
			if ($RayCastDown.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
				selected = false
		elif($RayCastLeft.is_colliding()):
			if ($RayCastLeft.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
				selected = false
		elif($RayCastUp.is_colliding()):
			if ($RayCastUp.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
				selected = false
		elif($RayCastRight.is_colliding()):
			if ($RayCastRight.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
				selected = false


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false;
			


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action("movement_click") and Input.is_action_just_pressed("movement_click") and not event.is_echo():
		selected = true;
	if event.is_action("movement_click") and Input.is_action_just_released("movement_click") and not event.is_echo():
		selected = false;
		get_parent().player2 = false;
		#var shortest_distance = global_position.distance_to(location)
		var distance = global_position.distance_to(location)
		if distance < maximum_distance and distance > minimum_distance:
			location = get_global_mouse_position()
			emit_signal("demoaiturnfinished")
		else:
			get_parent().player2 = true





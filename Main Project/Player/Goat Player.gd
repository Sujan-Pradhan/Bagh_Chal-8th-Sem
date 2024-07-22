#Refference is   https://www.youtube.com/watch?v=iSpWZzL2i1o

#this is the goat

extends KinematicBody2D

var selected = false;
signal demoaiturnfinished
var allowturn = false;


var location
var placed
var is_in_area
var initial_position
var final_position



func _ready():
	location =  get_position();
	placed = false
	is_in_area = false


func _physics_process(delta):
		if selected and get_parent().player2==true:
			global_position = lerp(global_position, get_global_mouse_position(),50*delta)
		else:
			global_position = lerp(global_position, location,10*delta)
		if not placed:
			if($RayCastDown.is_colliding() ):
				if ($RayCastDown.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
					selected = false
			elif($RayCastLeft.is_colliding() ):
				if ($RayCastLeft.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
					selected = false
			elif($RayCastUp.is_colliding() ):
				if ($RayCastUp.get_collider ( ).get_parent().get_name()== "Tiger" or "Goat"):
					selected = false
			elif($RayCastRight.is_colliding() ):
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
		if get_parent().all_Placed<20 and not placed and is_in_area:
			selected = false;
			get_parent().player2 = false;
			location = get_parent().get_parent().gameplay_position[final_position]
			initial_position = final_position
			get_parent().get_parent().item_in_zone[final_position][0] = "goat"
			get_parent().get_parent().item_in_zone[final_position][1] = get_path()
			placed = true
			get_parent().all_Placed= get_parent().all_Placed+1
			emit_signal("demoaiturnfinished")
		elif get_parent().all_Placed >=20 and placed and is_in_area:
			selected = false;
			get_parent().player2 = false;
			for i in get_parent().get_parent().allowed_moves[initial_position]:
				if i == final_position:
					get_parent().get_parent().item_in_zone[final_position][0] = "goat"
					get_parent().get_parent().item_in_zone[final_position][1] = get_path()
					
					get_parent().get_parent().item_in_zone[initial_position][0] = null
					get_parent().get_parent().item_in_zone[initial_position][1] = null
					#position mane zone ko naam
					initial_position = final_position
					location = get_parent().get_parent().gameplay_position[final_position]
					emit_signal("demoaiturnfinished")
			get_parent().player2 = true
		else:
			get_parent().player2 = true






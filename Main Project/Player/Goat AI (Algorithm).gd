extends KinematicBody2D


var location
var initial_position
var initial_location
var final_position
var final_location
var pos
var collided_player = null
signal goataiturnfinished
var is_in_area
var is_All_Placed
var is_placed = false


func _ready():
	location =  get_position();



func _physics_process(delta):
	if get_parent().player2==true:
		move()
		global_position = lerp(global_position, final_location,50*delta)
	else:
		global_position = lerp(global_position, location,10*delta)
		


func move():
	is_All_Placed = get_parent().all_Placed
	if  get_parent().all_Placed< 20 :
		
		final_position= get_parent().final_move
		final_location = get_parent().get_parent().gameplay_position[final_position]
		initial_position = final_position
		#get_parent().root_move = initial_position
		
		get_parent().get_parent().item_in_zone[final_position][0] = "goat"
		get_parent().get_parent().item_in_zone[final_position][1] = get_path()
		location = get_parent().get_parent().gameplay_position[final_position]
		get_parent().player2 =false
		get_parent().all_Placed = get_parent().all_Placed+1
		is_placed = true
		emit_signal("goataiturnfinished")
	
		
	elif is_All_Placed >= 20:
		initial_position = get_parent().root_move
		initial_location = get_parent().get_parent().gameplay_position[initial_position]
		
		get_parent().get_parent().item_in_zone[initial_position][0] = null
		get_parent().get_parent().item_in_zone[initial_position][1] = null
		
		final_position= get_parent().final_move2
		final_location = get_parent().get_parent().gameplay_position[final_position]
		
		get_parent().get_parent().item_in_zone[final_position][0] = "goat"
		get_parent().get_parent().item_in_zone[final_position][1] = get_path()
		
		location = get_parent().get_parent().gameplay_position[final_position]
		get_parent().player2 =false
		emit_signal("goataiturnfinished")




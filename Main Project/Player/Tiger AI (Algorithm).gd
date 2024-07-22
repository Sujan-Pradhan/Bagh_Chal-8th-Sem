#Refference is   https://www.youtube.com/watch?v=iSpWZzL2i1o

#this is tiger for algorithm

extends KinematicBody2D


var selected = false;
signal dragandfropturnfinished


var location
var initial_position
var initial_location
var final_position
var final_location
var pos
var collided_player = null



func _ready():
	location =  get_position();
	for i in get_parent().get_parent().gameplay_position:
		if location==get_parent().get_parent().gameplay_position[i]:
			initial_position = i
	


onready var node_path = null

func _physics_process(delta):
		if get_parent().player1==true:
			move()
			global_position = lerp(global_position, final_location,50*delta)
		else:
			global_position = lerp(global_position, location,10*delta)
			



func move():
	final_position= get_parent().final_position #AI ko final position 
	final_location = get_parent().get_parent().gameplay_position[final_position]
	
	initial_location = get_parent().get_parent().gameplay_position[initial_position]
	get_parent().get_parent().item_in_zone[initial_position][0] = null 
	initial_position = final_position
	get_parent().get_parent().item_in_zone[final_position][0] = "tiger"
	location = get_parent().get_parent().gameplay_position[initial_position]
	get_parent().player1 = false
	
	emit_signal("dragandfropturnfinished")


func set_newPosition(new_Location):
	for i in get_parent().get_parent().gameplay_position:
		if get_parent().get_parent().gameplay_position[i] == new_Location:
			var new_Position = i
			if get_parent().get_parent().item_in_zone[new_Position][0] == null:
				move_Position(new_Position)



func move_Position(final_pos):
	if get_parent().get_parent().item_in_zone[final_position][0] == "goat":
		var goat = get_node(get_parent().get_parent().item_in_zone[final_position][1])
		goat.queue_free()
		get_parent().goat_eaten = get_parent().goat_eaten+1
		if get_parent().goat_eaten == 5:
			get_parent().goat_eaten = 0;
			get_tree().change_scene("res://Main Project/Levels and interface/Tiger won.tscn")
		get_parent().get_parent().item_in_zone[initial_position][1] = null 
	get_parent().get_parent().item_in_zone[initial_position][0] = null 
	initial_position = final_pos
	get_parent().get_parent().item_in_zone[final_pos][0] = "tiger"
	location = get_parent().get_parent().gameplay_position[initial_position]
	selected = false
	get_parent().player1 = false
	emit_signal("dragandfropturnfinished")







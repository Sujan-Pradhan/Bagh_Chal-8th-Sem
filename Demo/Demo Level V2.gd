extends Node2D
class_name TurnQueue

var active_character

func initialize():
	active_character = 3
	print("level")

func dir():
	yield(active_character.dir(),"completed")
	var new_index : int = (active_character.get_index()+1)%get_child_count()
	




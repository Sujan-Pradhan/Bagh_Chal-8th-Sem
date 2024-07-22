extends Area2D


#area ma playera xa ki xaina ko dictionary

#ahile area ma vako player
var playerPresent

#area ma xireko player
var playerEntered 

var areaentered

#player samma ko node
var playernode


#dropzone samma ko node
var datanode

func _draw():
	draw_circle(Vector2.ZERO,30,Color.pink)
	








func _on_dropzone_body_entered(body):
	# body.get_name() le body ko naam dinxa
	# get_name() le position ko naam dinxa
	if body.get_parent().get_name() =="Goat":
		body.is_in_area = true
		body.final_position = get_name()
		
	if body.get_parent().get_name() =="Tiger":
		body.final_position = get_name()



func _on_dropzone_body_exited(body):
	if body.get_parent().get_name() =="Goat":
		body.is_in_area = false


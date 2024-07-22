extends Area2D
signal PlayerData(player)

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
	draw_circle(Vector2.ZERO,40,Color.green)



#yesma odd even ko kaam garna milxa

#func _on_dropzone_area_entered(area):
#	if get_overlapping_areas().size()>1:
#		area.get_parent().get_parent().selected = false
#	
#	else:
#		playernode = get_node(area.get_path()).get_parent().get_parent()

	
#	#tiger ki goat
#		playerEntered = area.get_parent().get_name()
#		areaentered = true


#func _on_dropzone_area_exited(area):
#	if get_overlapping_areas().size()>1:
#		get_parent().occupied[get_name()] = true
#	else:
#		playerEntered = null
#		areaentered == false
#		get_parent().occupied[get_name()] = false
#	#print(area.get_parent().get_name())
#	print(get_overlapping_areas())



#func _on_dropzone_input_event(viewport, event, shape_idx):
#	if event.is_action("movement_click") and Input.is_action_just_released("movement_click") and not event.is_echo() and areaentered:
	#if Input.is_action_just_released("movement_click") and areaentered:
#		print("dropzone vitra")
#		print(get_parent().occupied[get_name()])
		#var data = get_path()
#		print("ahile ko node")
#		print(get_name())
#		datanode = get_parent().occupied[get_name()]
#		get_parent().present_node = get_name()
#		areaentered == false
		#if datanode == false:
		#		print("dataemmitted for")
		#		print(get_name())
		#		playerPresent = playerEntered
		#		print(playerPresent)
		#		datanode = true
		#		get_parent().occupied[get_name()] = datanode
		#else:
		#	if playerPresent == playerEntered:
		#		#player ko selection off garne
		#		print(playernode.shortest_distance)
		#get_parent().present_node = get_name()





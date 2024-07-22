#Refference is   https://www.youtube.com/watch?v=iSpWZzL2i1o

#this is tiger

extends KinematicBody2D


#player bich ko hunu parne distance
var maximum_distance = 250
var minimum_distance = 100
var selected = false;
signal dragandfropturnfinished
#var allowturn = get_parent().player1;
var type = "tiger"


var location


func _ready():
	location =  get_position();

var node_path = null

func _physics_process(delta):
		if selected and get_parent().player1==true:
			global_position = lerp(global_position, get_global_mouse_position(),50*delta)
		else:
			global_position = lerp(global_position, location,10*delta)
		
		if($RayCastDown.is_colliding()):
			if ($RayCastDown.get_collider ( ).get_parent().get_name()== "Tiger"):
				selected = false
			elif($RayCastDown.get_collider ( ).get_parent().get_name()== "Goat"):
				 node_path = $RayCastDown.get_collider ( ).get_path()
				 print(node_path)
		elif($RayCastLeft.is_colliding()):
			if ($RayCastLeft.get_collider ( ).get_parent().get_name()== "Tiger"):
				selected = false
		elif($RayCastUp.is_colliding()):
			if ($RayCastUp.get_collider ( ).get_parent().get_name()== "Tiger"):
				selected = false
		elif($RayCastRight.is_colliding()):
			if ($RayCastRight.get_collider ( ).get_parent().get_name()== "Tiger"):
				selected = false




func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false;


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action("movement_click") and Input.is_action_just_pressed("movement_click") and not event.is_echo():
		selected = true;
	#yeuta event ma 1 choti matrai function run hoss vanera 
	#player farkexi pani tyai area ma release garda yo function run hudo raixa 
	if event.is_action("movement_click") and Input.is_action_just_released("movement_click") and not event.is_echo():
		var key = get_parent().get_parent().present_node
		selected = false;
		get_parent().player1= false
		#var shortest_distance = global_position.distance_to(location)
		var distance = global_position.distance_to(location)
		if node_path == null:
			if distance < maximum_distance and distance>minimum_distance:
				location = get_global_mouse_position()
				emit_signal("dragandfropturnfinished")
			else:
				get_parent().player1= true
		else:
			get_node(node_path)
			maximum_distance = 400
			minimum_distance = 200
			if distance < maximum_distance and distance>minimum_distance:
				var x_diff =(location.x - get_global_mouse_position().x)
				var y_diff = (location.y - get_global_mouse_position().y)  
				if ( x_diff <15 or y_diff <15):
					location = get_global_mouse_position()
					print(x_diff)
					print(y_diff)
					get_node(node_path).queue_free()
					maximum_distance = 250
					minimum_distance = 100
					node_path = null
					emit_signal("dragandfropturnfinished")
			else:
				get_parent().player1= true




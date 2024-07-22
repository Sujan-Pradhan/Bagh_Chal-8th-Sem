extends KinematicBody2D

var max_speed = 700
var speed = 0
var acceleration = 1200
var movedirection
var moving = false
var destination = Vector2()
var movement = Vector2()
var allow_move = true #icon lai thau ma matrai move garne milne banauna ko lagi
var node;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal demoplayerturnfinished

#muli ko turn based ko lagi
#onready var TURN = get_node("/root/DemoLevel")
#var Turn = TURN.turn
#export var done  = "undone"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.


#yesle chai UI ma click huda playera lai move garna bata jogauxa
func _unhandled_input(event):
	if event.is_action_pressed("movement_click"):
		moving = true
		destination = get_global_mouse_position()




func _physics_process(delta):
	if allow_move == true:
		if node != null:
			get_node(node).move(delta) #yo chai multiple items bata yeutaspecific choose garna ko lagi
#		move(delta)



func move(delta):
	if moving == false:
		speed = 0
	else:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	movement = position.direction_to(destination)*speed
	if position.distance_to(destination)>5:
		movement = move_and_slide(movement)
	else:
		moving = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



#source is : https://www.youtube.com/watch?v=05OixHPbxNA







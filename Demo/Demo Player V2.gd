#source is https://github.com/aimforbigfoot/NAD-LAB-Godot-Projects/blob/master/RoundMovements/src/player.gd
#source if https://www.youtube.com/watch?v=aNMBcr6pn_I
extends KinematicBody2D
signal endturn

var selected = false
var allowturn
export (float) var speed : float = 500.0

func _ready():
	allowturn = true


func _physics_process(delta: float) -> void:
	if selected == true and allowturn==true:
		var vel := (speed * dir() * delta)
		vel = move_and_slide(vel)

func dir() -> Vector2:
	var _dir : Vector2
	_dir = (get_global_mouse_position() - global_position).floor()
#	_dir = (get_global_mouse_position() - global_position).floor().clamped(100)
	return _dir 


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("movement_click"):
		selected = true;
	if Input.is_action_just_released("movement_click"):
		selected = false;
		allowturn = false;
		emit_signal("endturn");




func _on_DemoAI_demoaiturnfinished():
	allowturn = true

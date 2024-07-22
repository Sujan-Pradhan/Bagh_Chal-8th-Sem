extends Node2D

var player1 = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rest_point
var rest_nodes = []
var deslocation
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DemoAI_demoaiturnfinished():
	player1= true


func _on_DemoAI2_demoaiturnfinished():
	player1=true






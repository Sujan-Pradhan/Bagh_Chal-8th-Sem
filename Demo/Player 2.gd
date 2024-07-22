extends Node2D


var player2 = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DragDropPlayer_dragandfropturnfinished():
	player2 =true


func _on_DragDropPlayer2_dragandfropturnfinished():
	player2 = true

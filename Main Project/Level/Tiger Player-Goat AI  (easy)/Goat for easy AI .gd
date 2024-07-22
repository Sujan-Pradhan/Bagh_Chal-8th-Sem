extends Node2D
#AI Goat

var player2 = true
onready var all_Placed
onready var parent = get_node(".")


# Called when the node enters the scene tree for the first time.
func _ready():
	all_Placed = 0
	goat_selection()


func goat_selection():
	if all_Placed<20:
		var n = parent.get_child_count()
		var child = parent.get_child(n-1)
		move_child(child,0)

	else:
		var n = parent.get_child_count()
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var rand = rng.randi_range(0, n-1)
		var child = parent.get_child(rand)
		move_child(child,0)



func _on_Tiger_Player_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player2_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player3_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player4_tigerplayerturnfinished():
	player2 = true
	goat_selection()

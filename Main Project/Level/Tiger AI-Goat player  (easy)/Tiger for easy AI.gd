extends Node2D

#AI Tiger
var player1 = false
onready var parent = get_node(".")
onready var goat_eaten
onready var defeated


func _ready():
	goat_eaten = 0
	
	tiger_selection()


func tiger_selection():
	var n = get_child_count()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rand = rng.randi_range(0, n)
	
	var child = parent.get_child(rand)
	defeat_case()
	move_child(child,0)


func defeat_case():
	defeated = true
	for pos in get_parent().item_in_zone:
		var tiger_position 
		if get_parent().item_in_zone[pos][0] == "tiger":
			tiger_position = pos
			for nodes in get_parent().allowed_moves[tiger_position]:
				if get_parent().item_in_zone[nodes][0] == null:
					defeated = false
					print(" Tiger for easy AI Defeated false vayo")
					return false
	if defeated == true:
		print(" Tiger for easy AI Defeated True vayo")
		get_tree().change_scene("res://Main Project/Levels and interface/Goat won.tscn")


func _on_Goat_AI_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI2_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI3_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI4_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI5_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI6_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI7_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI8_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI9_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI10_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI11_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI12_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI13_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI14_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI15_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI16_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI17_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI18_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI19_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI20_demoaiturnfinished():
	player1= true
	tiger_selection()



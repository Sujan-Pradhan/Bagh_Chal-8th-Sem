extends Node2D

#player Tiger
onready var player1 = false
onready var parent = get_node(".")
onready var goat_eaten
onready var defeated


func _ready():
	
	goat_eaten = 0

func defeat_case(): 
	defeated = true
	for pos in get_parent().item_in_zone:
		var tiger_position 
		if get_parent().item_in_zone[pos][0] == "tiger":
			tiger_position = pos
			for nodes in get_parent().allowed_moves[tiger_position]:
				if get_parent().item_in_zone[nodes][0] == null:
					defeated = false
					print("Tiger for player Defeated false vayo")
					return false
	if defeated == true:
		print("Tiger for player Defeated True vayo")
		get_tree().change_scene("res://Main Project/Levels and interface/Goat won.tscn")



func _on_Goat_AI_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI2_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI3_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI4_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI5_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI6_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI7_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI8_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI9_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI10_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI11_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI12_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI13_goataiturnfinished():
	player1 = true


func _on_Goat_AI14_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI15_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI16_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI17_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI18_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI19_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI20_goataiturnfinished():
	defeat_case()
	player1 = true

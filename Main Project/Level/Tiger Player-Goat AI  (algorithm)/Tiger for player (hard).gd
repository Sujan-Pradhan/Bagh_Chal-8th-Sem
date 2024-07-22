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
					print("Tiger for player (hard) Defeated false vayo")
					return false
	if defeated == true:
		print("Tiger for player (hard) Defeated true vayo")
		get_tree().change_scene("res://Main Project/Levels and interface/Goat won.tscn")



func _on_Goat_AI_Algorithm_goataiturnfinished():
	defeat_case()
	player1 = true



func _on_Goat_AI_Algorithm2_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm3_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm4_goataiturnfinished():
	defeat_case()
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm5_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm6_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm7_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm8_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm9_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm10_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm11_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm12_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm13_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm14_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm15_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm16_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm17_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm18_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm19_goataiturnfinished():
	defeat_case()
	player1 = true


func _on_Goat_AI_Algorithm20_goataiturnfinished():
	defeat_case()
	player1 = true

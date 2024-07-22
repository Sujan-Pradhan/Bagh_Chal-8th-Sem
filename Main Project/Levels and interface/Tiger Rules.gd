extends Node2D




func _on_previous_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/playscene.tscn")


func _on_goat_rules_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/Goat rules.tscn")

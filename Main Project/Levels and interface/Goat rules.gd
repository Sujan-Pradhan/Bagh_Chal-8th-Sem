extends Node2D



func _on_tiger_rules_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/Tiger Rules.tscn")


func _on_play_scene_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/playscene.tscn")

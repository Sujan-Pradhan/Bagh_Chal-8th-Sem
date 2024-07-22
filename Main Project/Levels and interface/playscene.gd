extends Node2D





func _on_Play_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/ChooseLevel.tscn")


func _on_Rules_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/Tiger rules.tscn")

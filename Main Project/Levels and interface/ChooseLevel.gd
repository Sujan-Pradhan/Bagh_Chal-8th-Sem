extends Node2D


func _on_Easy_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/Easy level.tscn")


func _on_Hard_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/Hard level.tscn")

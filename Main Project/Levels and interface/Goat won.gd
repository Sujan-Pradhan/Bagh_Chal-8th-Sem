extends Node2D





func _on_Restart_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/ChooseLevel.tscn")


func _on_goto_main_pressed():
	get_tree().change_scene("res://Main Project/Levels and interface/playscene.tscn")

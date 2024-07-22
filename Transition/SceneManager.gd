extends Node2D

const SceneTwo = preload("res://Transition/SceneTwo.tscn")
const MainScene = preload("res://Main Project/MainScreen.tscn")

var timer

export var value = 0;

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 3
	timer.connect("timeout", self, "_timeout")


func _timeout():
	$TransitionScreen.transition()



func _on_TransitionScreen_transitioned():
	if value == 0:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(SceneTwo.instance())
		value =1;
	elif value ==1:
		$CurrentScene.get_child(0).queue_free()
		get_tree().change_scene("res://Main Project/MainScreen.tscn")



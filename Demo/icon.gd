extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#yesle chai UI ma click huda playera lai move garna bata jogauxa
func _unhandled_input(event):
	pass


func _physics_process(delta):
	movement(delta)

func movement(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

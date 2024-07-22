extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_line(Vector2(200,100), Vector2(600, 100), Color.pink, 8)
	draw_line(Vector2(200,100), Vector2(600, 500), Color.pink, 8)
	draw_line(Vector2(200,100), Vector2(200, 500), Color.pink, 8)
	draw_line(Vector2(600,100), Vector2(600, 500), Color.pink, 8)
	draw_line(Vector2(200,500), Vector2(600, 500), Color.pink, 8)
	draw_line(Vector2(600,100), Vector2(200, 500), Color.pink, 8)
	draw_line(Vector2(300,100), Vector2(300, 500), Color.pink, 8)
	draw_line(Vector2(400,100), Vector2(400, 500), Color.pink, 8)
	draw_line(Vector2(500,100), Vector2(500, 500), Color.pink, 8)
	draw_line(Vector2(200,200), Vector2(600, 200), Color.pink, 8)
	draw_line(Vector2(200,300), Vector2(600, 300), Color.pink, 8)
	draw_line(Vector2(200,400), Vector2(600, 400), Color.pink, 8)
	draw_line(Vector2(400,100), Vector2(200, 300), Color.pink, 8)
	draw_line(Vector2(400,100), Vector2(600, 300), Color.pink, 8)
	draw_line(Vector2(200,300), Vector2(400, 500), Color.pink, 8)
	draw_line(Vector2(600,300), Vector2(400, 500), Color.pink, 8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

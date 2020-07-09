extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var num_balls = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_ball():
	num_balls += 1
	print_debug(num_balls)
	
func remove_ball():
	num_balls -= 1
	print_debug(num_balls)

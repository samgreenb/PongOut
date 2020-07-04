extends KinematicBody2D

var speed = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	#global_position = Vector2(ProjectSettings.get_setting("display/window/size/width")/2,ProjectSettings.get_setting("display/window/size/height")/2)
	print_debug(ProjectSettings.get_setting("display/window/size/height"))
	pass # Replace with function body.
	
func _process(delta):
	if(Input.is_action_pressed("j2_up")):
		move_and_collide(Vector2.UP*speed)
	if(Input.is_action_pressed("j2_down")):
		move_and_collide(Vector2.DOWN*speed)

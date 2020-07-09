extends KinematicBody2D

var speed = 600
var scalaY = scale.y
var counter = 0
var labelP1
var labelP2
var up
var down

func _ready():
	labelP1 = get_tree().current_scene.get_node("PorteriaP1/PS")
	labelP2 = get_tree().current_scene.get_node("PorteriaP2/PS")
	pass

func _physics_process(delta):
	counter+=1
	if(Input.is_action_pressed(up)):
		move_and_collide(Vector2.UP*speed*delta)
	if(Input.is_action_pressed(down)):
		move_and_collide(Vector2.DOWN*speed*delta)
	if counter * delta > 1:
		#print_debug("lol")
		cambiar_tam()
		counter = 0

func cambiar_tam():
	var puntosP1 = labelP1.text.to_int()
	var puntosP2 = labelP2.text.to_int()
	if up == "j1_up":
		scale.y = scalaY + clamp(puntosP1 - puntosP2,-2,2) * 0.15
	else:
		scale.y = scalaY + clamp(puntosP2 - puntosP1,-2,2) * 0.15

extends KinematicBody2D

var speed = 600
var scalaY = scale.y


func _ready():
	pass
	
func _physics_process(delta):
	if(Input.is_action_pressed("j2_up")):
		move_and_collide(Vector2.UP*speed*delta)
	if(Input.is_action_pressed("j2_down")):
		move_and_collide(Vector2.DOWN*speed*delta)
	cambiar_tam()

func cambiar_tam():
	var labelP1 = get_tree().current_scene.get_node("PorteriaP1/P2S")
	var labelP2 = get_tree().current_scene.get_node("PorteriaP2/P1S")
	var puntosP1 = labelP1.text.to_int()
	var puntosP2 = labelP2.text.to_int()
	scale.y = scalaY + clamp(puntosP2 - puntosP1,-2,2) * 0.15

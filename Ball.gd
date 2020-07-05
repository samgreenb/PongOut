extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_destroy = 0
var xspeed = 100
var yspeed = 100
#const Ball = preload("res://Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2.ZERO,Vector2.RIGHT*400+Vector2.UP*200)
	can_destroy = 0
	#linear_velocity[0] = xspeed
	#linear_velocity[1] = yspeed
	angular_velocity = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ball_body_entered(body):
	print_debug(body.name.substr(0,5))
	pass # Replace with function body.


func _on_Ball_body_exited(body):
	if can_destroy == 1 and body.name.substr(0,5) == "Brick":
		can_destroy = 0
		body.queue_free()
		var ball = load("res://Ball.tscn").instance()
		ball.global_transform = global_transform
		get_tree().current_scene.add_child(ball)
		ball.apply_impulse(Vector2.ZERO,Vector2.RIGHT*200)
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	print_debug("Puedes romper")
	can_destroy = 1
	pass # Replace with function body.


func _on_Gol_area_entered(area):
	queue_free()
	pass # Replace with function body.

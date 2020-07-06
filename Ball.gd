extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_destroy = 0
var xspeed = 300
var yspeed = 300
var minxspeed = 300
onready var ani = $AnimatedSprite
var r = RandomNumberGenerator.new()
#const Ball = preload("res://Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#apply_impulse(Vector2.ZERO,Vector2.RIGHT*400+Vector2.UP*200)
	r.randomize()
	var rr = r.randi_range(1,4)
	ani.animation= String(rr)
	set_inertia(100000)
	can_destroy = 0
	linear_velocity[0] = xspeed
	angular_velocity = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if linear_velocity[0] < 0:
		linear_velocity[0] = -300
	elif linear_velocity[0] >= 0:
		linear_velocity[0] = 300
	if linear_velocity[1] < 0:
		linear_velocity[1] = -300
	elif linear_velocity[1] >= 0:
		linear_velocity[1] = 300
	pass


func _on_Ball_body_entered(body):
	#print_debug(body.name.substr(0,5))
	#print_debug(linear_velocity[0])
	pass # Replace with function body.


func _on_Ball_body_exited(body):
	if can_destroy == 1 and body.name.substr(0,5) == "Brick":
		can_destroy = 0
		body.destroy()
		var ball = load("res://Ball.tscn").instance()
		ball.global_transform = global_transform
		get_tree().current_scene.add_child(ball)
	else:
		pass
		#ball.apply_impulse(Vector2.ZERO,Vector2.RIGHT*200)
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	#print_debug("Puedes romper")
	can_destroy = 1
	pass # Replace with function body.


func _on_Gol_area_entered(area):
	queue_free()
	pass # Replace with function body.
	

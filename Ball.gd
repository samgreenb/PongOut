extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_destroy = 0
var xspeed = 300
var yspeed = 300
var minxspeed = 300
onready var ani = $AnimatedSprite
onready var sound = $AudioStreamPlayer
onready var ball_counter = $"/root/BallCounter"

signal created

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
	if global_position[0] < 512:
		linear_velocity[0] = xspeed
	else:
		linear_velocity[0] = -xspeed
	angular_velocity = 0
	
	if (global_position.x < 0
			or global_position.x > 1024
			or (global_position.y < 0
			or global_position.y > 600)):
				queue_free()
	
	connect("created",ball_counter,"add_ball")
	emit_signal("created")
	connect("tree_exited",ball_counter,"remove_ball")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if linear_velocity[0] < 0:
		linear_velocity[0] = -xspeed
	elif linear_velocity[0] >= 0:
		linear_velocity[0] = xspeed
	if linear_velocity[1] < 0:
		linear_velocity[1] = -xspeed
	elif linear_velocity[1] >= 0:
		linear_velocity[1] = xspeed
	pass

func first_ball():
	r.randomize()
	global_position[1] = r.randi_range(100,500)
	if r.randi_range(1,2) == 1:
		linear_velocity[1]=yspeed
	else:
		linear_velocity[1] =-yspeed
	pass # Replace with function body.

func _on_Ball_body_exited(body):
	if can_destroy == 1 and body.get_name() == "Brick":
		can_destroy = 0
		body.destroy()
		#var ball = load("res://Ball.tscn").instance()
		#ball.global_transform = global_transform
		#get_tree().current_scene.call_deferred("add_child", ball)
	else:
		sound.play()
		pass
		#ball.apply_impulse(Vector2.ZERO,Vector2.RIGHT*200)
		
	#xspeed += 4
	
	pass # Replace with function body.


func _on_Area2D_area_entered(_area):
	#print_debug("Puedes romper")
	can_destroy = 1
	pass # Replace with function body.


func _on_Gol_area_entered(_area):

	queue_free()
	pass # Replace with function body.
	

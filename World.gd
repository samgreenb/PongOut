extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var t = $Label
var ended = false
onready var b1 = $Ball
onready var b2 = $Ball2
onready var p1 = $Paleta
onready var p2 = $Paleta2

# Called when the node enters the scene tree for the first time.
func _ready():
	t.connect("end",self,"end")
	b1.first_ball()
	b2.first_ball()
	b1.connect("tree_exited",self,"end")
	p1.up = "j1_up"
	p1.down = "j1_down"
	p2.up = "j2_up"
	p2.down = "j2_down"
	$"/root/BallCounter".num_balls = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("reset") and ended:
		get_tree().change_scene("res://World.tscn")
#	pass

func end():
	ended = true

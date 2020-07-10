extends Node2D

onready var t = $Label
onready var b1 = $Ball
onready var b2 = $Ball2
onready var p1 = $Paleta
onready var p2 = $Paleta2

var ended = false

func _ready():
	b1.first_ball()
	b2.first_ball()
	p1.up = "j1_up"
	p1.down = "j1_down"
	p2.up = "j2_up"
	p2.down = "j2_down"
	$"/root/BallCounter".num_balls = 2
	
	t.connect("end",self,"end")
	
func _process(_delta):
	if Input.is_action_just_pressed("reset") and ended:
		get_tree().change_scene("res://World.tscn")

func end():
	ended = true

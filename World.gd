extends Node2D

const countdown = preload("res://main_menu/countdown.tscn")

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
		var cd1 = countdown.instance()
		get_tree().current_scene.add_child(cd1)
		cd1.set_global_position(Vector2(612,240))
		cd1.connect("start",self,"load_game")
		
		var cd2 = countdown.instance()
		get_tree().current_scene.add_child(cd2)
		cd2.set_global_position(Vector2(332,240))
		
		get_tree().get_root().find_node("WinScreen", true, false).queue_free()

func end():
	ended = true

func load_game():
	get_tree().change_scene("res://World.tscn")

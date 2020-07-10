extends Node2D

const game = preload("res://World.tscn")
const countdown = preload("res://main_menu/countdown.tscn")

onready var title = $Sprite

var not_started = true

func _process(_delta):
	if Input.is_action_just_pressed("ui_select") and not_started:
		not_started = false
		start()

func start():
	var cd1 = countdown.instance()
	get_tree().current_scene.add_child(cd1)
	cd1.set_global_position(Vector2(612,240))
	cd1.connect("start",self,"load_game")
	
	var cd2 = countdown.instance()
	get_tree().current_scene.add_child(cd2)
	cd2.set_global_position(Vector2(332,240))
	
	title.queue_free()

func load_game():
	get_tree().change_scene_to(game)

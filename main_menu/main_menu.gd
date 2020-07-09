extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var not_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select") and not_started:
		not_started = false
		start()
	pass

func start():
	var cd = load("res://main_menu/countdown.tscn")
	cd = cd.instance()
	get_tree().current_scene.add_child(cd)
	pass

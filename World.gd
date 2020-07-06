extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var t = $Label
var ended = false
# Called when the node enters the scene tree for the first time.
func _ready():
	t.connect("end",self,"end")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("reset") and ended:
		get_tree().change_scene("res://World.tscn")
#	pass

func end():
	ended = true

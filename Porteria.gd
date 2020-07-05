extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var puntos = $P2S
var p = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PorteriaP1_area_entered(area):
	p+=1
	puntos.text= String(p)
	pass # Replace with function body.

extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var r = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	r.randomize()
	var rr = r.randi_range(1,2)
	match rr:
		1:
			set_stream(load("res://sonidos/Goal_More.ogg"))
		2:
			set_stream(load("res://sonidos/samscore.ogg"))
	get_stream().set_loop(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

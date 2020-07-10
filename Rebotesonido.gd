extends AudioStreamPlayer

var r = RandomNumberGenerator.new()

func _ready():
	r.randomize()
	var rr = r.randi_range(1,3)
	match rr:
		1:
			set_stream(load("res://sonidos/rebotesam.ogg"))
		2:
			set_stream(load("res://sonidos/Rebote_More.ogg"))
		3:
			set_stream(load("res://sonidos/boingroman.ogg"))
	get_stream().set_loop(false)
	set_volume_db(-20)

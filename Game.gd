extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dynamic_font = DynamicFont.new()
var tiempo_pasado = 0
var num = 0
var t
# Called when the node enters the scene tree for the first time.
func _ready():
	t = Timer.new()
	t.set_one_shot(true)
	add_child(t)
	t.start(6)
	t.connect("timeout",self,"end")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tiempo_pasado += 1
	#print_debug(tiempo_pasado % 7)
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 3: 
			num = 1 #reiniciamos el contador de las fonts
		dynamic_font.font_data = load("res://Sprites/Font_pong"+String(num)+"-Regular.ttf")
		dynamic_font.size = 64
		set("custom_fonts/font", dynamic_font)
		if !t.is_stopped():
			text = String(floor(t.time_left))
		print_debug(t.get_time_left())
		#print_debug("num=" + String(num))
		num += 1	
#	pass

func end():
	t.stop()
	pass

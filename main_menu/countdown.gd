extends Label

var dynamic_font = DynamicFont.new()
var tiempo_pasado = 0
var num = 1
var t

signal start

func _ready():
	t = Timer.new()
	t.set_one_shot(true)
	add_child(t)
	t.start(3)
	t.connect("timeout",self,"end")
	
func _process(_delta):
	tiempo_pasado += 1
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 3: 
			num = 1 #reiniciamos el contador de las fonts
		dynamic_font.font_data = load("res://Sprites/Font_pong"+String(num)+"-Regular.ttf")
		dynamic_font.size = 200
		set("custom_fonts/font", dynamic_font)
		num += 1
		
		if !t.is_stopped():
			text = String(ceil(t.time_left))

func end():
	t.stop()
	emit_signal("start")

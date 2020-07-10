extends Label

const win_screen = preload("res://WinScreen.tscn")

onready var ball_counter = $"/root/BallCounter"

var dynamic_font = DynamicFont.new()
var tiempo_pasado = 0
var num = 1
var t

signal end

func _ready():
	t = Timer.new()
	t.set_one_shot(true)
	add_child(t)
	t.start(30)
	t.connect("timeout",self,"end")
	
func _process(_delta):
	if ball_counter.num_balls == 0:
		end()
		
	tiempo_pasado += 1
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 3: 
			num = 1 #reiniciamos el contador de las fonts
			
		dynamic_font.font_data = load("res://Sprites/Font_pong"+String(num)+"-Regular.ttf")
		dynamic_font.size = 64
		set("custom_fonts/font", dynamic_font)
		
		if !t.is_stopped():
			text = String(floor(t.time_left))
			
		num += 1

func end():
	var j2 = get_tree().get_root().find_node("PorteriaP1", true, false).puntos.text
	var j1 = get_tree().get_root().find_node("PorteriaP2", true, false).puntos.text
	j2 = j2.to_int()
	j1 = j1.to_int()
	
	var ws = win_screen.instance()
	ws.global_position = Vector2(512,300)
	ws.frame = clamp(j2-j1,-1,1)+1
	get_tree().current_scene.add_child(ws)
	
	emit_signal("end")
	$"/root/BallCounter".delete_all()
	
	queue_free()

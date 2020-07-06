extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var puntos = $P1S
var p = 0
var num = 0 #numero de la animacion de la font
var tiempo_pasado = 0
var dynamic_font = DynamicFont.new()
const sound = preload("res://PuntoSonido.tscn")
const font1 = preload("res://Sprites/Font_pong1-Regular.ttf")
const font2 = preload("res://Sprites/Font_pong2-Regular.ttf")
const font3 = preload("res://Sprites/Font_pong3-Regular.ttf")
var fonts
# Called when the node enters the scene tree for the first time.
func _ready():
	fonts = []
	fonts.append(font1)
	fonts.append(font2)
	fonts.append(font3)
	pass # Replace with function body.


func _process(delta):
	tiempo_pasado += 1
	#print_debug(tiempo_pasado % 7)
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 2: 
			num = 0 #reiniciamos el contador de las fonts
		dynamic_font.font_data = fonts[num-1]
		dynamic_font.size = 64
		$P1S.set("custom_fonts/font", dynamic_font)
		#print_debug("num=" + String(num))
		num += 1
	pass


func _on_PorteriaP2_area_entered(area):
	p+=1
	puntos.text= String(p)
	var s = sound.instance()
	get_tree().current_scene.add_child(s)
	s.play()
	pass # Replace with function body.

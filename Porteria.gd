extends Area2D

const sound = preload("res://PuntoSonido.tscn")
const confeti = preload("res://Confetti.tscn")

onready var puntos = $PS

var p = 0
var num = 1 #numero de la animacion de la font
var tiempo_pasado = 0
var dynamic_font = DynamicFont.new()
var font = []

func _ready():
	font.append(load("res://Sprites/Font_pong1-Regular.ttf"))
	font.append(load("res://Sprites/Font_pong2-Regular.ttf"))
	font.append(load("res://Sprites/Font_pong3-Regular.ttf"))
	
func _process(_delta):
	tiempo_pasado += 1
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 3: 
			num = 1 #reiniciamos el contador de las fonts
		dynamic_font.font_data = font[num-1]
		dynamic_font.size = 64
		puntos.set("custom_fonts/font", dynamic_font)
		num += 1

func _on_Porteria_area_entered(area):
	p += 1
	puntos.text = String(p)
	
	var s = sound.instance()
	get_tree().current_scene.call_deferred("add_child",s)
	
	var c = confeti.instance()
	c.global_position = area.global_position
	get_tree().current_scene.call_deferred("add_child", c)
	if area.global_position[0] > 300:
		c.flip_h = true
		c.play()
	else:
		c.play()
	c.connect("animation_finished",c,"queue_free")

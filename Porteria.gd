extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var puntos = $PS
var p = 0
var num = 2 #numero de la animacion de la font
var tiempo_pasado = 0
var dynamic_font = DynamicFont.new()
const sound = preload("res://PuntoSonido.tscn")
const confeti = preload("res://Confetti.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	tiempo_pasado += 1
	#print_debug(tiempo_pasado % 7)
	if tiempo_pasado % 7 == 0: #entramos cada 7 frames para cambiar la font
		if num > 3: 
			num = 1 #reiniciamos el contador de las fonts
		dynamic_font.font_data = load("res://Sprites/Font_pong"+String(num)+"-Regular.ttf")
		dynamic_font.size = 64
		puntos.set("custom_fonts/font", dynamic_font)
		#print_debug("num=" + String(num))
		num += 1
	pass

func _on_Porteria_area_entered(area):
	p+=1
	puntos.text= String(p)
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
	pass # Replace with function body.

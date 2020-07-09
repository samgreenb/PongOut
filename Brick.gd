extends StaticBody2D

const eplosion = preload("res://Explosion.tscn")
const sonidoexp = preload("res://ExplosionSonido.tscn")
const Ball = preload("res://Ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	
func get_name():
	return "Brick"
	
func destroy():
	var explosion = eplosion.instance()
	explosion.global_position = global_position
	explosion.play()
	var s = sonidoexp.instance()
	get_tree().current_scene.call_deferred("add_child",s)
	get_tree().current_scene.call_deferred("add_child", explosion)
	explosion.connect("animation_finished",explosion,"queue_free")
	var b = Ball.instance()
	b.global_transform = global_transform
	get_tree().current_scene.call_deferred("add_child", b)
	queue_free()

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
	get_tree().current_scene.add_child(s)
	s.play()
	get_tree().current_scene.add_child(explosion)
	var b = Ball.instance()
	b.global_transform = global_transform
	get_tree().current_scene.call_deferred("add_child", b)
	queue_free()

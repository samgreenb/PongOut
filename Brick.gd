extends StaticBody2D

const eplosion = preload("res://Explosion.tscn")
const sonidoexp = preload("res://ExplosionSonido.tscn")
const Ball = preload("res://Ball.tscn")
	
func get_name():
	return "Brick"
	
func destroy():
	var explosion = eplosion.instance()
	explosion.global_position = global_position
	explosion.play()
	get_tree().current_scene.call_deferred("add_child", explosion)
	explosion.connect("animation_finished",explosion,"queue_free")
	
	var s = sonidoexp.instance()
	get_tree().current_scene.call_deferred("add_child",s)
	
	var b = Ball.instance()
	b.global_transform = global_transform
	get_tree().current_scene.call_deferred("add_child", b)
	
	queue_free()

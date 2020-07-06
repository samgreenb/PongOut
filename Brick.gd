extends StaticBody2D

const eplosion = preload("res://Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	
func destroy():
	var explosion = eplosion.instance()
	explosion.global_position = global_position
	explosion.play()
	var s = load("res://ExplosionSonido.tscn")
	s = s.instance()
	get_tree().current_scene.add_child(s)
	s.play()
	get_tree().current_scene.add_child(explosion)
	
	queue_free()

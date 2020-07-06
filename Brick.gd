extends StaticBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	
func destroy():
	var explosion = load("res://Explosion.tscn").instance()
	explosion.global_position = global_position
	explosion.play()
	get_tree().current_scene.add_child(explosion)
	queue_free()

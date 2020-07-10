extends Node

var num_balls = 0

signal game_ended

func add_ball():
	num_balls += 1
	
func remove_ball():
	num_balls -= 1

func delete_all():
	emit_signal("game_ended")

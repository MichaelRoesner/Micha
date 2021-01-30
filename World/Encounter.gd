extends Area2D

func _on_Encounter_body_entered(_body):
	if randf() < 0.3:
		assert(get_tree().change_scene("res://Game.tscn") == 0)
		
		
	if get_tree().change_scene(("res://Game.tscn")) != OK:
		print("An unexpected error occured when trying to switch to the Readme scene")

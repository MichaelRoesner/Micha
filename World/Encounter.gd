extends Area2D


#func _on_Area2D_body_entered(_body):
#	if randf() < 0.3:
#		get_tree().change_scene("res://CombatScene.tscn")


#var encounter_hit_chance = null

#func _ready():
#	randomize()
#	encounter_hit_chance = int(rand_range(0, 11)) % 10
#	print(encounter_hit_chance)

#func _on_Encounter_body_entered(_body):
#	if encounter_hit_chance < 3: #funktioniert nicht, es wechselt immer
#		assert(get_tree().change_scene("res://Game.tscn") == 0)
		
		
#	if get_tree().change_scene(("res://Game.tscn")) != OK:
#		print("An unexpected error occured when trying to switch to the Readme scene")


func _on_Encounter_body_entered(_body):
	print(randf())
	if randf() < 0.25:
		if get_tree().change_scene("res://Game.tscn") != OK:
			print("failed")
		

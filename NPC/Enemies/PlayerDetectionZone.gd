extends Area2D

var MainPlayer = null

func can_see_player():
	return MainPlayer != null

func _on_PlayerDetectionZone_body_entered(body):
	MainPlayer = body

func _on_PlayerDetectionZone_body_exited(_body):
	MainPlayer = null



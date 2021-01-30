extends Label

func _process(_delta):
	#if input.is_action_just_pressed für menutaste
	#visible
	text = "FPS: " + str(Engine.get_frames_per_second())
	text += "\nMemory: " + "%3.2f" % (OS.get_static_memory_usage() / 1048576.0) + "MiB"
	
func _ready():
	pass

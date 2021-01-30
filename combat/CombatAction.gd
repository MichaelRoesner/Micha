extends Node

class_name CombatAction

signal execute_finished()

export var icon : Texture
export var description : String = "Base combat action"

func execute(_actor : Battler, _target : Battler) -> void:
	print("%s missing overwrite of the execute method" % name)
	emit_signal("execute_finished")

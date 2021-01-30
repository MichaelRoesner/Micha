extends Node2D


enum BATTLE_STATES {
	PLAYER,
	ENEMY,
	WIN,
	LOSE
}

var player_team = Array()
var player_turn_order = Array()

var enemy_team = Array()
var enemy_turn_order = Array()
var random_enemy_count = null

var current_state

func _ready():
	_handle_states(BATTLE_STATES.PLAYER)
	randomize()
	random_enemy_count = int(rand_range(3, 9)) % 10
	
	for i in range (0, 8):
		pass
		
	for i in range (0, random_enemy_count):
		pass
		
	

func _handle_states(new_state):
	current_state = new_state
	
	match current_state:
		BATTLE_STATES.PLAYER:
			player_turn_order = player_team.duplicate()
			pass
	
		BATTLE_STATES.ENEMY:
			enemy_turn_order = enemy_team.duplicate()
			pass
		
		BATTLE_STATES.WIN:
			pass
		
		BATTLE_STATES.LOSE:
			pass

func _handle_player_turn():
	if player_turn_order.size() > 0:
		player_turn_order[0]._attack_entity(enemy_team[2])
		player_turn_order.pop_front()
	else:
		_handle_states(BATTLE_STATES.ENEMY)
		
func _handle_enemy_turn():
	while enemy_turn_order.size() > 0:
		enemy_turn_order[0]._attack_entity(player_team[1])
		enemy_turn_order.pop_front()
		
	_handle_states(BATTLE_STATES.PLAYER)

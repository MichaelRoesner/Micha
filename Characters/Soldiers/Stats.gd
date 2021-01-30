extends Node



#Character Stats
export (int) var max_hp = 100
export (int) var strength = 10
export (int) var intelligence = 8
export (int) var armor = 10
export (int) var magic_armor = 5
export (int) var mana = 2



#Level System
export (int) var level = 1
var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)



func get_required_experience(level):
	return round(pow(level, 1.8) + level * 4)

	
func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()


func level_up():
	level += 1
	experience_required = get_required_experience(level + 1)
	
	var stats = ["max_hp", "strength", "intelligence", "armor", "magic_armor", "mana"]
	var random_stat = stats[randi() % stats.size()]
	set(random_stat, get(random_stat) + randi() % 4 + 2)
	#set(stats, get(stats) + 10)
	#get()

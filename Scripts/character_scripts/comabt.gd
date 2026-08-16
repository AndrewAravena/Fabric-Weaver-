extends Node
class_name player_combat

@onready var model = $".." as Player_Model 

static  var input_priority : Dictionary = { 
	"light_attack_pressed" : 1, 
	"heavy_attack_pressed" : 2, 
	"heavy_attack_charged_pressed": 3, 
	
}

func translate_combat_actions( new_input : InputPackage) -> InputPackage:
	if not new_input.combat_actions.is_empty():
		new_input.combat_actions.sort_custom(combat_action_priority_sort)
		var best_input_action : String = new_input.combat_actions[0]
		var table = model.active_weapon.basic_attacks
		if not model.player.is_on_floor():
			table = model.active_weapon.air_attacks
		if table.has(best_input_action):
			new_input.actions.append(table[best_input_action])
	return new_input


static func combat_action_priority_sort( a : String , b : String ):
	if input_priority[a] > input_priority[b]:
		return true
	else:
		return false

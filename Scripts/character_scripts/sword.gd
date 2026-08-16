extends Weapon
class_name Sword

func _ready():
	basic_attacks = { 
		"light_attack_pressed": "slash_1"
	}
	
	air_attacks = {
		"light_attack_pressed": "air_slash_1"
	}

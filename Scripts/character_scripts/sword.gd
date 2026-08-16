extends Weapon
class_name Sword

func _ready():
	basic_attacks = { 
		"light_attack_pressed": "slash_1",
		"heavy_attack_pressed": "heavy_1",
	}
	
	air_attacks = {
		"light_attack_pressed": "air_slash_1",
		"heavy_attack_pressed": "heavy_1",
	}

func get_hit_data() -> HitData:
	return holder.current_move.from_hit_data(self)

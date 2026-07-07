extends Move
class_name Idle

func _ready() -> void:
	animation = "Tpose"
	

func check_relevance(input) -> String:
	input.actions.sort_custom(moves_priority_sort)
	if not player.is_on_floor():
		return "midair"
	else:
		return input.actions[0]
	
func on_enter_state():
	player.velocity = Vector3.ZERO

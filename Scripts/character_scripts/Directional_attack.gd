extends combo

@export var root_move : Move
@export var panic_click_block: float = 0.1 
@export var primary_input : String 
@export var next_attack: String 
@export_enum("forward", "back", "neutral") var required_direction := "neutral"
@export var direction_deadzone : float = 0.3 

func _ready():
	triggered_move = next_attack
	
func is_triggered( input : InputPackage):
	if not input.actions.has(primary_input):
		return false
	if not root_move.works_longer_than(panic_click_block):
		return false
	return _direction_matches(input.input_direction)
	
func _direction_matches(dir : Vector2) -> bool:
	match required_direction:
		"forward":
			return dir.y < -direction_deadzone
		"back":
			return dir.y > direction_deadzone
		"neutral": 
			return dir.length() < direction_deadzone
	return false 

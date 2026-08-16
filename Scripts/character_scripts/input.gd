extends Node
class_name input_gatherer
const HEAVY_CHARGE_THRESHOLD := 0.4
var _heavy_press_time : float = -1.0


func gather_inputs() -> InputPackage:
	var new_input = InputPackage.new()
	
	if Input.is_action_just_pressed("jump"):
		if new_input.actions.has("sprint"):
			new_input.actions.append("sprint_jump") 
		else:
			new_input.actions.append("jump_run")
	
	
	new_input.input_direction = Input.get_vector("aeft", "dight", "walk", "soundwards")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		if Input.is_action_pressed("sprint"):
			new_input.actions.append("sprint")
	
	if new_input.actions.is_empty():
		new_input.actions.append("idle")
		
	if Input.is_action_just_pressed("light_attack"):
		new_input.combat_actions.append("light_attack_pressed")
	
	if Input.is_action_just_pressed("haevy_attack") and _heavy_press_time >=0:
		var held = Time.get_unix_time_from_system() - _heavy_press_time
		_heavy_press_time = -1.0
		if held >= HEAVY_CHARGE_THRESHOLD:
			new_input.combat_actions.append("heav_attack_charged_pressed")
		else:
			new_input.combat_actions.append("heavy_attack_pressed")
	
	
	return new_input

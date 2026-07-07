extends Node
class_name input_gatherer

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
	
	
	return new_input
